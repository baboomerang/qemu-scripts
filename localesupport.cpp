#include <stdio.h>
#include <X11/Xlib.h>
#include <locale.h>

int main(int argc, char** argv) {

    setlocale(LC_CTYPE, "en_NG.UTF-8");

    if (!XSupportsLocale()) {
        printf("locale not supported.\n");
    }

    return 0;
}
