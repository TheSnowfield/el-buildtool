## el-buildtool

This EPL build tool enables you to compile the EPL code without your win32 environment,
and support the modern CI/CD-driven development.

This EPL build tool can only compile the EPL source file as a Win32 COFF file (*.obj), and we can use the GCC to link it to a standard executable file. It can't generate the Win32 executable file directly.

You may notice that the EPL is not an open source language, Its source file is completely binary, we can even set a password for encrypting it. And the EPL compiler is not open source either.

Thus, we have to use the binary located in [rootfs/el](rootfs/el).

The ecl.exe comes from the EPL community, it can drive the e.exe parameterized compiles without creating the GUI.

## Use this Action

More arguments can be found in the [action.yml](action.yml) file.

```yml
uses: TheSnowfeld/el-buildtool@v1

  # the EPL source code file
  file: rootfs/test/main.e

  # compiler option: Enable the fast array accessing mode
  opt_fast_array: true

  # compiler option: Enable the stack checking after DLL calling
  opt_stack_check: false

  # compiler option: Enable the compile-time deadloop checking
  opt_deadloop_check: false
```

## Credits
- EPL (Easy Programming Language) IDE  
  from the web
- ecl.exe [@zhongjianhua163](https://github.com/zhongjianhua163)  
  [https://bbs.125.la/thread-14625796-1-1.html](https://bbs.125.la/thread-14625796-1-1.html)

## License
This project is licensed under the WTFPL License,  
See the [LICENSE](LICENSE) file for details.
