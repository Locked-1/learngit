# CMake generated Testfile for 
# Source directory: /home/wuyulong/cmake-3.13.2/Tests/CMakeOnly
# Build directory: /home/wuyulong/cmake-3.13.2/Tests/CMakeOnly
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(CMakeOnly.LinkInterfaceLoop "/home/wuyulong/cmake-3.13.2/bin/cmake" "-DTEST=LinkInterfaceLoop" "-P" "/home/wuyulong/cmake-3.13.2/Tests/CMakeOnly/Test.cmake")
set_tests_properties(CMakeOnly.LinkInterfaceLoop PROPERTIES  TIMEOUT "90")
add_test(CMakeOnly.CheckSymbolExists "/home/wuyulong/cmake-3.13.2/bin/cmake" "-DTEST=CheckSymbolExists" "-P" "/home/wuyulong/cmake-3.13.2/Tests/CMakeOnly/Test.cmake")
add_test(CMakeOnly.CheckCXXSymbolExists "/home/wuyulong/cmake-3.13.2/bin/cmake" "-DTEST=CheckCXXSymbolExists" "-P" "/home/wuyulong/cmake-3.13.2/Tests/CMakeOnly/Test.cmake")
add_test(CMakeOnly.CheckCXXCompilerFlag "/home/wuyulong/cmake-3.13.2/bin/cmake" "-DTEST=CheckCXXCompilerFlag" "-P" "/home/wuyulong/cmake-3.13.2/Tests/CMakeOnly/Test.cmake")
add_test(CMakeOnly.CheckLanguage "/home/wuyulong/cmake-3.13.2/bin/cmake" "-DTEST=CheckLanguage" "-P" "/home/wuyulong/cmake-3.13.2/Tests/CMakeOnly/Test.cmake")
add_test(CMakeOnly.CheckStructHasMember "/home/wuyulong/cmake-3.13.2/bin/cmake" "-DTEST=CheckStructHasMember" "-P" "/home/wuyulong/cmake-3.13.2/Tests/CMakeOnly/Test.cmake")
add_test(CMakeOnly.CompilerIdC "/home/wuyulong/cmake-3.13.2/bin/cmake" "-DTEST=CompilerIdC" "-P" "/home/wuyulong/cmake-3.13.2/Tests/CMakeOnly/Test.cmake")
add_test(CMakeOnly.CompilerIdCXX "/home/wuyulong/cmake-3.13.2/bin/cmake" "-DTEST=CompilerIdCXX" "-P" "/home/wuyulong/cmake-3.13.2/Tests/CMakeOnly/Test.cmake")
add_test(CMakeOnly.AllFindModules "/home/wuyulong/cmake-3.13.2/bin/cmake" "-DTEST=AllFindModules" "-DCMAKE_ARGS=-DCMake_TEST_CMakeOnly.AllFindModules_NO_VERSION=" "-P" "/home/wuyulong/cmake-3.13.2/Tests/CMakeOnly/Test.cmake")
add_test(CMakeOnly.SelectLibraryConfigurations "/home/wuyulong/cmake-3.13.2/bin/cmake" "-DTEST=SelectLibraryConfigurations" "-P" "/home/wuyulong/cmake-3.13.2/Tests/CMakeOnly/Test.cmake")
add_test(CMakeOnly.TargetScope "/home/wuyulong/cmake-3.13.2/bin/cmake" "-DTEST=TargetScope" "-P" "/home/wuyulong/cmake-3.13.2/Tests/CMakeOnly/Test.cmake")
add_test(CMakeOnly.find_library "/home/wuyulong/cmake-3.13.2/bin/cmake" "-DTEST=find_library" "-P" "/home/wuyulong/cmake-3.13.2/Tests/CMakeOnly/Test.cmake")
add_test(CMakeOnly.find_path "/home/wuyulong/cmake-3.13.2/bin/cmake" "-DTEST=find_path" "-P" "/home/wuyulong/cmake-3.13.2/Tests/CMakeOnly/Test.cmake")
add_test(CMakeOnly.ProjectInclude "/home/wuyulong/cmake-3.13.2/bin/cmake" "-DTEST=ProjectInclude" "-DCMAKE_ARGS=-DCMAKE_PROJECT_ProjectInclude_INCLUDE=/home/wuyulong/cmake-3.13.2/Tests/CMakeOnly/ProjectInclude/include.cmake" "-P" "/home/wuyulong/cmake-3.13.2/Tests/CMakeOnly/Test.cmake")
add_test(CMakeOnly.MajorVersionSelection-PythonLibs_2 "/home/wuyulong/cmake-3.13.2/bin/cmake" "-DTEST=MajorVersionSelection-PythonLibs_2" "-DTEST_SOURCE=MajorVersionSelection" "-DCMAKE_ARGS=-DMAJOR_TEST_MODULE=PythonLibs;-DMAJOR_TEST_VERSION=2;-DMAJOR_TEST_NO_LANGUAGES=FALSE;-DMAJOR_TEST_VERSION_VAR=PYTHONLIBS_VERSION_STRING" "-P" "/home/wuyulong/cmake-3.13.2/Tests/CMakeOnly/Test.cmake")
add_test(CMakeOnly.MajorVersionSelection-PythonLibs_3 "/home/wuyulong/cmake-3.13.2/bin/cmake" "-DTEST=MajorVersionSelection-PythonLibs_3" "-DTEST_SOURCE=MajorVersionSelection" "-DCMAKE_ARGS=-DMAJOR_TEST_MODULE=PythonLibs;-DMAJOR_TEST_VERSION=3;-DMAJOR_TEST_NO_LANGUAGES=FALSE;-DMAJOR_TEST_VERSION_VAR=PYTHONLIBS_VERSION_STRING" "-P" "/home/wuyulong/cmake-3.13.2/Tests/CMakeOnly/Test.cmake")
add_test(CMakeOnly.MajorVersionSelection-PythonInterp_2 "/home/wuyulong/cmake-3.13.2/bin/cmake" "-DTEST=MajorVersionSelection-PythonInterp_2" "-DTEST_SOURCE=MajorVersionSelection" "-DCMAKE_ARGS=-DMAJOR_TEST_MODULE=PythonInterp;-DMAJOR_TEST_VERSION=2;-DMAJOR_TEST_NO_LANGUAGES=TRUE;-DMAJOR_TEST_VERSION_VAR=PYTHON_VERSION_STRING" "-P" "/home/wuyulong/cmake-3.13.2/Tests/CMakeOnly/Test.cmake")
add_test(CMakeOnly.MajorVersionSelection-PythonInterp_3 "/home/wuyulong/cmake-3.13.2/bin/cmake" "-DTEST=MajorVersionSelection-PythonInterp_3" "-DTEST_SOURCE=MajorVersionSelection" "-DCMAKE_ARGS=-DMAJOR_TEST_MODULE=PythonInterp;-DMAJOR_TEST_VERSION=3;-DMAJOR_TEST_NO_LANGUAGES=TRUE;-DMAJOR_TEST_VERSION_VAR=PYTHON_VERSION_STRING" "-P" "/home/wuyulong/cmake-3.13.2/Tests/CMakeOnly/Test.cmake")
add_test(CMakeOnly.MajorVersionSelection-Qt_3 "/home/wuyulong/cmake-3.13.2/bin/cmake" "-DTEST=MajorVersionSelection-Qt_3" "-DTEST_SOURCE=MajorVersionSelection" "-DCMAKE_ARGS=-DMAJOR_TEST_MODULE=Qt;-DMAJOR_TEST_VERSION=3;-DMAJOR_TEST_NO_LANGUAGES=FALSE;-DMAJOR_TEST_VERSION_VAR=QT_VERSION_STRING" "-P" "/home/wuyulong/cmake-3.13.2/Tests/CMakeOnly/Test.cmake")
add_test(CMakeOnly.MajorVersionSelection-Qt_4 "/home/wuyulong/cmake-3.13.2/bin/cmake" "-DTEST=MajorVersionSelection-Qt_4" "-DTEST_SOURCE=MajorVersionSelection" "-DCMAKE_ARGS=-DMAJOR_TEST_MODULE=Qt;-DMAJOR_TEST_VERSION=4;-DMAJOR_TEST_NO_LANGUAGES=FALSE;-DMAJOR_TEST_VERSION_VAR=QT_VERSION_STRING" "-P" "/home/wuyulong/cmake-3.13.2/Tests/CMakeOnly/Test.cmake")
