{- | Utilities for testing partial semigroups using the hedgehog property
testing library. -}

module Test.PartialSemigroup.Hedgehog (assoc) where

import Data.PartialSemigroup (PartialSemigroup (..))
import Hedgehog (Gen, Property, forAll, property, (===))
import Prelude (($), Eq, Show, pure, sequence_)

{- | The partial semigroup associativity axiom:

For all @x@, @y@, @z@: If @x '<>?' y = 'Just' xy@ and @y '<>?' z = 'Just' yz@,
then @x '<>?' yz = xy '<>?' z@. -}
assoc :: (PartialSemigroup a, Eq a, Show a) => Gen a -> Property
assoc gen = property $ do
    x <- forAll gen
    y <- forAll gen
    z <- forAll gen
    sequence_ $ do
        xy <- x <>? y
        yz <- y <>? z
        pure (x <>? yz === xy <>? z)
