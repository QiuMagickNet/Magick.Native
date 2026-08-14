SCRIPT_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"

# Compiler settings
if [[ "${DEBUG_BUILD}" ]]; then
  export FLAGS="-g3 -O0 -fPIC -Wall -DDEBUG"
  export CMAKE_BUILD_TYPE="Debug"
else
  export FLAGS="-O3 -fPIC -Wall -DNDEBUG"
  export CMAKE_BUILD_TYPE="Release"
fi
export CFLAGS=$FLAGS
export CXXFLAGS=$FLAGS
export INSTALL_PREFIX="/tmp/dependencies"
export CPPFLAGS="-I$INSTALL_PREFIX/include"
export LDFLAGS="-L$INSTALL_PREFIX/lib"
export PKG_CONFIG_PATH="$INSTALL_PREFIX/lib/pkgconfig"

# Android NDK settings
export ANDROID_NDK_HOME="${ANDROID_NDK_HOME:-/opt/android-ndk}"
TOOLCHAIN="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64"
export TARGET="armv7a-linux-androideabi21"

# Settings
export CMAKE_COMMAND="cmake"
export CMAKE_OPTIONS="-DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK_HOME/build/cmake/android.toolchain.cmake -DANDROID_ABI=armeabi-v7a -DANDROID_PLATFORM=android-21"
export CONFIGURE="./configure"
export CONFIGURE_OPTIONS="--host armv7a-linux-androideabi"
export EXTENSION="so"
export IMAGEMAGICK_OPTIONS=""
export MAKE="make -j$(nproc)"
export PLATFORM=ANDROID

# Set compiler for cross-compilation
export CC="$TOOLCHAIN/bin/$TARGET-clang"
export CXX="$TOOLCHAIN/bin/$TARGET-clang++"
export AR="$TOOLCHAIN/bin/llvm-ar"
export RANLIB="$TOOLCHAIN/bin/llvm-ranlib"
export STRIP="$TOOLCHAIN/bin/llvm-strip"