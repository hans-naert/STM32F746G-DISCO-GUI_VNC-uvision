/* Simple shared module to pass detected NFC UID strings from the NFC polling
 * code (running in main loop) to the emWin GUI thread. All GUI updates must
 * happen from the GUI thread, so the polling code only calls
 * NFC_DisplaySetUID(). The GUI thread periodically calls
 * NFC_DisplayFetchUID() to obtain and clear the latest value.
 */
#ifndef NFC_DISPLAY_H
#define NFC_DISPLAY_H

#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Store (copy) a new UID string. Thread-safe for simple single-writer /
 * single-reader usage due to use of volatile flag and atomic pointer-sized
 * operations assumed on Cortex-M. */
void NFC_DisplaySetUID(const char *uidStr);

/* Fetch latest UID into provided buffer. Returns 1 if a new UID was copied
 * (and the internal dirty flag cleared), 0 if no new UID is pending.
 */
int NFC_DisplayFetchUID(char *out, size_t outSize);

#ifdef __cplusplus
}
#endif

#endif /* NFC_DISPLAY_H */
