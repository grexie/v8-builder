            assets: |
              ~/v8/v8/out.gn/${{ matrix.arch }}.${{ matrix.scheme}}/*.dylib
              ~/v8/v8/out.gn/${{ matrix.arch }}.${{ matrix.scheme }}/**/*.a
              ~/v8/v8/out.gn/${{ matrix.arch }}.${{ matrix.scheme }}/*.dat
              ~/v8/v8/out.gn/${{ matrix.arch }}.${{ matrix.scheme }}/bytecode_builtins_list_generator
              ~/v8/v8/out.gn/${{ matrix.arch }}.${{ matrix.scheme }}/gen-regexp-special-case
              ~/v8/v8/out.gn/${{ matrix.arch }}.${{ matrix.scheme }}/mksnapshot
              ~/v8/v8/out.gn/${{ matrix.arch }}.${{ matrix.scheme }}/torque
          - platform: android
            platform-name: Android
            runs-on: ubuntu-latest
            assets: |
              ~/v8/v8/out.gn/${{ matrix.arch }}.${{ matrix.scheme }}/*.so
              ~/v8/v8/out.gn/${{ matrix.arch }}.${{ matrix.scheme }}/**/*.a
              ~/v8/v8/out.gn/${{ matrix.arch }}.${{ matrix.scheme }}/*.dat
              ~/v8/v8/out.gn/${{ matrix.arch }}.${{ matrix.scheme }}/clang_*/bytecode_builtins_list_generator
              ~/v8/v8/out.gn/${{ matrix.arch }}.${{ matrix.scheme }}/clang_*/gen-regexp-special-case
              ~/v8/v8/out.gn/${{ matrix.arch }}.${{ matrix.scheme }}/clang_*/mksnapshot
              ~/v8/v8/out.gn/${{ matrix.arch }}.${{ matrix.scheme }}/clang_*/torque
          - platform: linux
            platform-name: Linux
            runs-on: ubuntu-latest
            assets: |
              ~/v8/v8/out.gn/${{ matrix.arch }}.${{ matrix.scheme }}/*.so
              ~/v8/v8/out.gn/${{ matrix.arch }}.${{ matrix.scheme }}/**/*.a
              ~/v8/v8/out.gn/${{ matrix.arch }}.${{ matrix.scheme }}/*.dat
              ~/v8/v8/out.gn/${{ matrix.arch }}.${{ matrix.scheme }}/bytecode_builtins_list_generator
              ~/v8/v8/out.gn/${{ matrix.arch }}.${{ matrix.scheme }}/gen-regexp-special-case
              ~/v8/v8/out.gn/${{ matrix.arch }}.${{ matrix.scheme }}/mksnapshot
              ~/v8/v8/out.gn/${{ matrix.arch }}.${{ matrix.scheme }}/torque
          - name: windows
            platform-name: Windows
            runs-on: windows-latest
            assets: |
              v8/v8/out.gn/${{ matrix.arch }}.${{ matrix.scheme }}/*.dll
              v8/v8/out.gn/${{ matrix.arch }}.${{ matrix.scheme }}/*.lib
              v8/v8/out.gn/${{ matrix.arch }}.${{ matrix.scheme }}/*.exp
              v8/v8/out.gn/${{ matrix.arch }}.${{ matrix.scheme }}/*.ilk
              v8/v8/out.gn/${{ matrix.arch }}.${{ matrix.scheme }}/*.exe
              v8/v8/out.gn/${{ matrix.arch }}.${{ matrix.scheme }}/*.dat
