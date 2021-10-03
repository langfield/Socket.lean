import Lake
open System Lake DSL

def nativeOTarget (pkgDir : FilePath) : FileTarget :=
  oFileTarget (pkgDir / "../build/native/native.o") (pkgDir / "../native/native.c" : FilePath) #[] "gcc"

def cLibTarget (pkgDir : FilePath) : FileTarget :=
  staticLibTarget (pkgDir / "../build/native/native.a") #[nativeOTarget pkgDir]

package (pkgDir) (args) {
  name := "socket"
  srcDir := "../"
  buildDir := "../build"
  libRoots := #[`Socket]
  moreLibTargets := #[cLibTarget pkgDir]
}