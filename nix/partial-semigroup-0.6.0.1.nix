{ mkDerivation, base, hedgehog, lib }:
mkDerivation {
  pname = "partial-semigroup";
  version = "0.6.0.1";
  sha256 = "28605417603b39235ce845b5be45fd6f271124bb40e1f32c1762028356d9f7ff";
  libraryHaskellDepends = [ base ];
  testHaskellDepends = [ base hedgehog ];
  homepage = "https://github.com/typeclasses/partial-semigroup";
  description = "A partial binary associative operator";
  license = lib.licenses.asl20;
}
