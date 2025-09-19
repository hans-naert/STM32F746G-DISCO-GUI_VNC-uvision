#include "nfc_display.h"
#include <string.h>

static char gLastUid[64];
static volatile int gUidDirty = 0;

void NFC_DisplaySetUID(const char *uidStr)
{
    if(!uidStr) return;
    /* Copy and mark dirty */
    strncpy(gLastUid, uidStr, sizeof(gLastUid)-1);
    gLastUid[sizeof(gLastUid)-1] = '\0';
    gUidDirty = 1;
}

int NFC_DisplayFetchUID(char *out, size_t outSize)
{
    if(!out || outSize == 0) return 0;
    if(!gUidDirty) return 0;
    /* Clear flag first to avoid race with writer producing same value again */
    gUidDirty = 0;
    strncpy(out, gLastUid, outSize - 1);
    out[outSize - 1] = '\0';
    return 1;
}
