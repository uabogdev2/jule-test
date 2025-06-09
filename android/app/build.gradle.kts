plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}

// Logic to read local.properties for versionCode and versionName
val localProperties = java.util.Properties()
val localPropertiesFile = rootProject.file("local.properties")
if (localPropertiesFile.exists()) {
    localPropertiesFile.inputStream().use { localProperties.load(it) }
}
val flutterVersionCode = localProperties.getProperty("flutter.versionCode")?.toIntOrNull() ?: 1
val flutterVersionName = localProperties.getProperty("flutter.versionName") ?: "1.0"

android {
    namespace = "com.example.cercle_mystique" // From original
    compileSdk = 34 // Common default, Flutter overrides if needed

    // ndkVersion is typically set by the Flutter plugin based on project configuration or defaults.
    // If you need to force a specific version, you can uncomment and set it:
    // ndkVersion = "25.1.8937393" // Example NDK version

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }

    kotlinOptions {
        jvmTarget = "1.8"
    }

    defaultConfig {
        applicationId = "com.example.cercle_mystique" // From original
        minSdk = 21 // Common default, Flutter overrides if needed.
        targetSdk = 34 // Common default, Flutter overrides if needed.
        versionCode = flutterVersionCode
        versionName = flutterVersionName
        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
    }

    signingConfigs {
        // Flutter's build process typically handles signing configurations.
        // For manual setup, you would define them here.
        // Example for debug (though Flutter manages this automatically):
        getByName("debug") {
            // storeFile = file("debug.keystore") // Path to your debug keystore
            // storePassword = "android"
            // keyAlias = "androiddebugkey"
            // keyPassword = "android"
        }
        // Example for release (replace with your actual keystore details):
        // create("release") {
        //     storeFile = file("path/to/your/release.keystore")
        //     storePassword = System.getenv("KEYSTORE_PASSWORD")
        //     keyAlias = System.getenv("KEY_ALIAS")
        //     keyPassword = System.getenv("KEY_PASSWORD")
        // }
    }

    buildTypes {
        release {
            // signingConfig = signingConfigs.getByName("release") // Uncomment if you have a release signingConfig
            signingConfig = signingConfigs.getByName("debug") // Placeholder, matches original
            isMinifyEnabled = false // Default for Flutter, can be true for production.
            // proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
        }
        // debug {
        //     signingConfig = signingConfigs.getByName("debug")
        // }
    }

    // Flutter projects usually don't need explicit packagingOptions here for common scenarios.
    // packagingOptions {
    //      resources.excludes.add("/META-INF/{AL2.0,LGPL2.1}")
    // }
}

// Dependencies are managed by the Flutter plugin.
// If you have specific native Android module dependencies, list them here.
dependencies {
    // implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8:1.9.22") // Usually managed by Kotlin plugin
}

// Flutter plugin configuration from the original file.
flutter {
    source = "../.."
}
