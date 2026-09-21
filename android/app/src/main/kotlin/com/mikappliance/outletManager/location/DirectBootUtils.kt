package com.mikappliance.outletManager.location

import android.content.Context
import android.os.Build

/**
 * `BOOT_COMPLETED` fires once per boot, and — confirmed by testing — it can
 * (and did) arrive *before* the user has entered their PIN/pattern for the
 * first time since reboot. Until that first unlock, a regular Context's
 * SharedPreferences/database calls silently resolve against the
 * (inaccessible) Credential Encrypted storage area and read back empty
 * defaults rather than throwing — so `BootReceiver` read "not active" and
 * gave up, even though a session genuinely was active.
 *
 * [TrackingStateStore] (visit/outlet coordinates, no credentials) and
 * [LocationQueueDb] (queued pings, not sensitive on their own) are safe to
 * keep in Device Protected storage instead, which is readable before first
 * unlock — so capture can resume immediately on boot. [SecureTokenStore]
 * deliberately stays in the default Credential Encrypted area since it
 * holds auth tokens; sync just waits for first unlock, which is the
 * correct tradeoff for a security-sensitive store like that one.
 */
fun deviceProtectedContext(context: Context): Context {
    return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
        context.createDeviceProtectedStorageContext()
    } else {
        context
    }
}
