static const char norm_fg[] = "#8fd4d3";
static const char norm_bg[] = "#05870A";
static const char norm_border[] = "#649493";

static const char sel_fg[] = "#8fd4d3";
static const char sel_bg[] = "#8AD072";
static const char sel_border[] = "#8fd4d3";

static const char urg_fg[] = "#8fd4d3";
static const char urg_bg[] = "#5D5752";
static const char urg_border[] = "#5D5752";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
