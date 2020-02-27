package com.example.invitation

import androidx.annotation.NonNull;
import android.view.WindowManager;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        window.setFlags(WindowManager.LayoutParams.FLAG_SECURE, WindowManager.LayoutParams.FLAG_SECURE)
        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }
}
