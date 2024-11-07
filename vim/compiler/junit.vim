let current_compiler = "junit"

CompilerSet makeprg=javac\ -d\ bin\ src/main/**/*.java\ &&\ java\ -jar\ lib/junit-platform-console-standalone-1.10.2.jar\ execute\ --details=flat\ --disable-banner\ --class-path\ ./bin\ --scan-class-path
set errorformat=
\%-G%.%#build.xml:%.%#,
\%-G%.%#warning:\ %.%#,
\%-G%\\C%.%#EXPECTED%.%#,
\%f:%l:\ %#%m,
\C:%f:%l:\ %m,
\%DEntering:\ %f\ %\\=,
\%ECaused\ by:%[%^:]%#:%\\=\ %\\=%m,
\%ERoot\ cause:%[%^:]%#:%\\=\ %\\=%m,
\%Ecom.%[%^:]%#:%\\=\ %\\=%m,
\%Eorg.%[%^:]%#:%\\=\ %\\=%m,
\%Ejava.%[%^:]%#:%\\=\ %\\=%m,
\%Ejunit.%[%^:]%#:%\\=\ %\\=%m,
\%-Z%\\C\ at\ com.mypkg.%.%#.test%[A-Z]%.%#(%f:%l)\ %\\=,
\%-Z%\\C\ at\ com.mypkg.%.%#.setUp(%f:%l)\ %\\=,
\%-Z%\\C\ at\ com.mypkg.%.%#.tearDown(%f:%l)\ %\\=,
\%-Z%^\ %#%$,
\%-C%.%#,
\%-G%.%#
