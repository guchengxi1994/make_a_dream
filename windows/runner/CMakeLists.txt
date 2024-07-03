cmake_minimum_required(VERSION 3.14)
project(runner LANGUAGES CXX)

# Define the application target. To change its name, change BINARY_NAME in the
# top-level CMakeLists.txt, not the value here, or `flutter run` will no longer
# work.
#
# Any new source files that you add to the application should be added here.
add_executable(${BINARY_NAME} WIN32
  "flutter_window.cpp"
  "main.cpp"
  "utils.cpp"
  "win32_window.cpp"
  "${FLUTTER_MANAGED_DIR}/generated_plugin_registrant.cc"
  "Runner.rc"
  "runner.exe.manifest"
)

# Apply the standard set of build settings. This can be removed for applications
# that need different build settings.
apply_standard_settings(${BINARY_NAME})

# Add preprocessor definitions for the build version.
target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_VERSION=\"${FLUTTER_VERSION}\"")
target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_VERSION_MAJOR=${FLUTTER_VERSION_MAJOR}")
target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_VERSION_MINOR=${FLUTTER_VERSION_MINOR}")
target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_VERSION_PATCH=${FLUTTER_VERSION_PATCH}")
target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_VERSION_BUILD=${FLUTTER_VERSION_BUILD}")

# Disable Windows macros that collide with C++ standard library functions.
target_compile_definitions(${BINARY_NAME} PRIVATE "NOMINMAX")

# Add dependency libraries and include directories. Add any application-specific
# dependencies here.
target_link_libraries(${BINARY_NAME} PRIVATE flutter flutter_wrapper_app)
target_link_libraries(${BINARY_NAME} PRIVATE "dwmapi.lib")
target_include_directories(${BINARY_NAME} PRIVATE "${CMAKE_SOURCE_DIR}")

# Run the Flutter tool portions of the build. This must not be removed.
add_dependencies(${BINARY_NAME} flutter_assemble)


get_filename_component(P1 ${CMAKE_CURRENT_BINARY_DIR} DIRECTORY)
message(STATUS "P1 ==> " ${P1})

string(REPLACE "/build/windows/x64" "" ROOT_DIR ${P1})

message(STATUS "ROOT_DIR ==> " ${ROOT_DIR})

# create .env if .env not exists
set(ENV_PATH ${ROOT_DIR}/env.json)
set(PROMPT_PATH ${ROOT_DIR}/prompts.json)
set(ACH_PATH ${ROOT_DIR}/achievements.json)
set(PLOT_PATH ${ROOT_DIR}/plot.json)
set(ROLE_QUIZ_PATH ${ROOT_DIR}/role_quiz.json)

set(MSVCP_PATH ${ROOT_DIR}/dlls/msvcp140.dll)
set(VCRUNTIME ${ROOT_DIR}/dlls/vcruntime140.dll)
set(VCRUNTIME2 ${ROOT_DIR}/dlls/vcruntime140_1.dll)

if(NOT EXISTS ${ENV_PATH})
    set(MULTILINE_TEXT
        "
        {
          \"models\": [
              {
                  \"tag\": \"text-model\",
                  \"llm-base\": \"https://****/v1\",
                  \"llm-model-name\": \"****\",
                  \"llm-sk\": \"****\"
              }
          ]
      }
        "
    )
    file(WRITE ${ENV_PATH} ${MULTILINE_TEXT})
    message("File did not exist, so it was created.")
else()
    message("File already exists.")
endif()

add_custom_target(copy-runtime-files ALL
  COMMAND ${CMAKE_COMMAND} -E copy ${ENV_PATH} ${P1}/runner/Debug/env.json
  COMMAND ${CMAKE_COMMAND} -E copy ${ENV_PATH} ${P1}/runner/Release/env.json
  COMMAND ${CMAKE_COMMAND} -E copy ${ENV_PATH} ${P1}/runner/Profile/env.json

  COMMAND ${CMAKE_COMMAND} -E copy ${PROMPT_PATH} ${P1}/runner/Debug/prompts.json
  COMMAND ${CMAKE_COMMAND} -E copy ${PROMPT_PATH} ${P1}/runner/Release/prompts.json
  COMMAND ${CMAKE_COMMAND} -E copy ${PROMPT_PATH} ${P1}/runner/Profile/prompts.json

  COMMAND ${CMAKE_COMMAND} -E copy ${ACH_PATH} ${P1}/runner/Debug/achievements.json
  COMMAND ${CMAKE_COMMAND} -E copy ${ACH_PATH} ${P1}/runner/Release/achievements.json
  COMMAND ${CMAKE_COMMAND} -E copy ${ACH_PATH} ${P1}/runner/Profile/achievements.json

  COMMAND ${CMAKE_COMMAND} -E copy ${PLOT_PATH} ${P1}/runner/Debug/plot.json
  COMMAND ${CMAKE_COMMAND} -E copy ${PLOT_PATH} ${P1}/runner/Release/plot.json
  COMMAND ${CMAKE_COMMAND} -E copy ${PLOT_PATH} ${P1}/runner/Profile/plot.json

  COMMAND ${CMAKE_COMMAND} -E copy ${ROLE_QUIZ_PATH} ${P1}/runner/Debug/role_quiz.json
  COMMAND ${CMAKE_COMMAND} -E copy ${ROLE_QUIZ_PATH} ${P1}/runner/Release/role_quiz.json
  COMMAND ${CMAKE_COMMAND} -E copy ${ROLE_QUIZ_PATH} ${P1}/runner/Profile/role_quiz.json


  COMMAND ${CMAKE_COMMAND} -E copy ${MSVCP_PATH} ${P1}/runner/Release/msvcp140.dll
  COMMAND ${CMAKE_COMMAND} -E copy ${VCRUNTIME} ${P1}/runner/Release/vcruntime140.dll
  COMMAND ${CMAKE_COMMAND} -E copy ${VCRUNTIME2} ${P1}/runner/Release/vcruntime140_1.dll
)