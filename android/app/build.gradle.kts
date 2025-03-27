plugins {
    id("com.android.application")
    id("com.google.gms.google-services") // Firebase Configuration
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin") // Flutter Plugin
}

android {
    namespace = "com.example.otakustream"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973" // Set required NDK version

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.otakustream"
        minSdk = 23  // ✅ Corrected syntax
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug") // Use debug keys for now
        }
    }
}

flutter {
    source = "../.."
}
