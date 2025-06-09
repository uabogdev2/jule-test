// Top-level build file
plugins {
    // Appliquer 'false' car ces plugins sont appliqués dans le module :app
    id("com.android.application") version "8.2.2" apply false
    id("org.jetbrains.kotlin.android") version "1.9.22" apply false // Utiliser une version récente de Kotlin
    id("com.google.gms.google-services") version "4.4.1" apply false
}

tasks.register("clean", Delete::class) {
    delete(rootProject.buildDir)
}
