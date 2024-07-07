## el-buildtool

This EPL build tool enables you to compile the EPL code without your win32 environment,
and support the modern CI-driven development.

You may notice that the EPL is not an open source language, It's source file is completely binary, we can even set a password for encrypting it. And the EPL compiler is not open source either.
Thus, we have to use the binary located in [rootfs/el](rootfs/el).

The ecl.exe comes from the EPL community, it can drive the e.exe parameterized compiles without creating the GUI.

## Use this Action
```yml
uses: action/el-buildtool@v1
```

## Credits
- EPL (Easy Programming Language) IDE  
  from the web
- ecl.exe [@zhongjianhua163](https://github.com/zhongjianhua163)  
  [https://bbs.125.la/thread-14625796-1-1.html](https://bbs.125.la/thread-14625796-1-1.html)

## License
This project is licensed under the WTFPL License,  
See the [LICENSE](LICENSE) file for details.