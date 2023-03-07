
打开 http://repo.xposed.info/module/de.robv.android.xposed.installer
下载 de.robv.android.xposed.installer_v33_36570c.apk (770.28 KB)
打开 https://jcenter.bintray.com/de/robv/android/xposed/api/
下载 api-82.jar
帮助 https://github.com/rovo89/XposedBridge/wiki/Development-tutorial

eclipse创建安卓工程 --> 新增lib目录 --> api-82.jar拖入后构建路径(实际上就是使用第三方jar包) --> 修改AndroidManifest.xml
Project -- > properties --> Resource --> Other --> UTF-8

    <application
        android:allowBackup="true"
        android:icon="@drawable/ic_launcher"
        android:label="@string/app_name" >
        <meta-data
            android:name="xposedmodule"
            android:value="true" />
        <meta-data
            android:name="xposeddescription"
            android:value="my name is xiaojianbang" />
        <meta-data
            android:name="xposedminversion"
            android:value="53" />
    </application>

src --> 新建一个包com.xposed --> 新建一个类

package com.xposed;

import android.util.Log;
import de.robv.android.xposed.IXposedHookLoadPackage;
import de.robv.android.xposed.XposedBridge;
import de.robv.android.xposed.callbacks.XC_LoadPackage.LoadPackageParam;

public class Hook implements IXposedHookLoadPackage {
	public void handleLoadPackage(final LoadPackageParam lpparam) throws Throwable {
		
		Log.d("xiaojianbang", "hook...");
		
		if (!lpparam.packageName.equals("com.xingin.xhs")) return;
		
		Log.d("xiaojianbang", "hooking...");
	}
}

assets --> xposed_init --> com.xposed.Hook

安装xposed框架 --> 给予root权限 模拟器软重启 真机重启
安装自写的模块 --> 勾选 --> 框架 模拟器软重启 真机重启
