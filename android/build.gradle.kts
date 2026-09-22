allprojects {
    repositories {
        google()
        mavenCentral()
        // flutter_background_geolocation (Transistorsoft) — its Android AAR
        // isn't published to Maven Central/Google's repo.
        maven(url = "https://maven.transistorsoft.com")
    }
}

subprojects {
    afterEvaluate {
        val androidExtension = extensions.findByName("android") ?: return@afterEvaluate

        // Force compileSdk for legacy plugin Gradle files (e.g. isar_flutter_libs)
        // that still pin old values like compileSdkVersion 30.
        val setCompileSdkVersion = androidExtension.javaClass.methods.firstOrNull {
            it.name == "setCompileSdkVersion" && it.parameterTypes.size == 1
        }
        setCompileSdkVersion?.let { method ->
            val paramType = method.parameterTypes.firstOrNull()
            when (paramType) {
                Int::class.javaPrimitiveType,
                Int::class.java,
                java.lang.Integer::class.java,
                Number::class.java,
                Any::class.java,
                null,
                -> method.invoke(androidExtension, 36)

                String::class.java -> method.invoke(androidExtension, "android-36")

                else -> method.invoke(androidExtension, 36)
            }
        }
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
