
# The complete list of third-party libraries:"ToyBox/extlibs/readme.txt"
macro(toy_SetThirdPartyLibraryPath)

	# Mac LLVM-GCC
	if(APPLE)
		set(TOY_SDK_INC         "$ENV{HOME}/ToyBoxSDK/include" )
		set(TOY_SDK_LIB         "$ENV{HOME}/ToyBoxSDK/lib/mac_llvmgcc_x64_release" )
	# Visual Studio
	elseif(MSVC)
		set(TOY_SDK_INC         "D:/ToyBoxSDK/include" )
		set(TOY_SDK_LIB         "D:/ToyBoxSDK/lib/msvc2015_x64_release" )
	# MinGW
	elseif(WIN32)
		set(TOY_SDK_INC         "D:/ToyBoxSDK/include" )
		set(TOY_SDK_LIB         "D:/ToyBoxSDK/lib/tdm_gcc_x64_release" )
	# Linux GCC
	elseif(UNIX)
		set(TOY_SDK_INC         "$ENV{HOME}/ToyBoxSDK/include" )
		set(TOY_SDK_LIB         "$ENV{HOME}/ToyBoxSDK/lib/ubuntu_gcc_x64_release" )
	endif()

	if(NOT EXISTS ${TOY_SDK_INC} AND NOT EXISTS ${TOY_SDK_LIB})
		# TOY_SDK_INC and TOY_SDK_LIB is not necessary.
		# You can just modify the following paths and ignore this error.
		# Take a look!
		# https://github.com/ToyAuthor/ToyBoxSDK
		message(FATAL_ERROR "ToyBox:Are you sure you have all the third-party libraries?")
	else()
		# Mac
		if(APPLE)
		# Visual Studio & MinGW
		elseif(WIN32)
			file(GLOB TEMP_DIR
				${TOY_SDK_LIB}/SFML/*.dll
				${TOY_SDK_LIB}/GMP/*.dll
				${TOY_SDK_LIB}/freetype/*.dll
				${TOY_SDK_LIB}/FLTK/*.dll
				${TOY_SDK_LIB}/libpng/*.dll
			)
			file(COPY ${TEMP_DIR} DESTINATION ${TOY_ROOT_BINARY_DIR}/bin/)
			unset(TEMP_DIR)
		# Linux
		elseif(UNIX)
			file(GLOB TEMP_DIR
				${TOY_SDK_LIB}/SFML/*.so
				${TOY_SDK_LIB}/GMP/*.so
				${TOY_SDK_LIB}/freetype/*.so
				${TOY_SDK_LIB}/FLTK/*.so
				${TOY_SDK_LIB}/libpng/*.so
			)
			file(COPY ${TEMP_DIR} DESTINATION ${TOY_ROOT_BINARY_DIR}/bin/)
			unset(TEMP_DIR)
		endif()
	endif()

	#---------------------------------------------------------------------------

	set(TOY_include_boost       "${TOY_SDK_INC}" )
	set(TOY_library_boost       "${TOY_ROOT_BINARY_DIR}/extlibs/boost" )


	set(TOY_include_lua         "${TOY_ROOT_SOURCE_DIR}/extlibs/lua" )
	set(TOY_library_lua         "${TOY_ROOT_BINARY_DIR}/extlibs/lua" )
	set(TOY_libname_lua         "lua" )


	set(TOY_include_lz4         "${TOY_ROOT_SOURCE_DIR}/extlibs/lz4" )
	set(TOY_library_lz4         "${TOY_ROOT_BINARY_DIR}/extlibs/lz4" )
	set(TOY_libname_lz4         "lz4" )


	set(TOY_include_zlib        "${TOY_ROOT_SOURCE_DIR}/extlibs/zlib" "${TOY_ROOT_BINARY_DIR}/extlibs/zlib" )
	set(TOY_library_zlib        "${TOY_ROOT_BINARY_DIR}/extlibs/zlib" )
	set(TOY_libname_zlib        "zlib" )


	if(UNIX)
	set(TOY_include_7zip        "${TOY_ROOT_SOURCE_DIR}/extlibs/p7zip" )
	set(TOY_library_7zip        "${TOY_ROOT_BINARY_DIR}/extlibs/p7zip" )
	set(TOY_libname_7zip        "p7zip" )
	else()
	set(TOY_include_7zip        "${TOY_ROOT_SOURCE_DIR}/extlibs/7zip" )
	set(TOY_library_7zip        "${TOY_ROOT_BINARY_DIR}/extlibs/7zip" )
	set(TOY_libname_7zip        "7zip" )
	endif()


	set(TOY_include_glew        "${TOY_ROOT_SOURCE_DIR}/extlibs/glew/include" )
	set(TOY_library_glew        "${TOY_ROOT_BINARY_DIR}/extlibs/glew" )
	set(TOY_libname_glew        "glew" )


	set(TOY_include_glm         "${TOY_ROOT_SOURCE_DIR}/extlibs/glm" )

	set(TOY_include_freetype    "${TOY_SDK_INC}/freetype" )
	set(TOY_library_freetype    "${TOY_SDK_LIB}/freetype" )
	set(TOY_libname_freetype    "freetype" )
	set(TOY_include_sfml        "${TOY_SDK_INC}" )
	set(TOY_library_sfml        "${TOY_SDK_LIB}/SFML" )
	set(TOY_libname_sfml_main   "sfml-main" )
	set(TOY_libname_sfml_system "sfml-system" )
	set(TOY_libname_sfml_window "sfml-window" )
	set(TOY_libname_sfml_graph  "sfml-graphics" )
	set(TOY_libname_sfml_audio  "sfml-audio" )
	set(TOY_libname_sfml_network"sfml-network" )
endmacro(toy_SetThirdPartyLibraryPath)
