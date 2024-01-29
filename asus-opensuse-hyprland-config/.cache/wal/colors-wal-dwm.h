static const char norm_fg[] = "#cdbfdd";
static const char norm_bg[] = "#0a080b";
static const char norm_border[] = "#8f859a";

static const char sel_fg[] = "#cdbfdd";
static const char sel_bg[] = "#6F5A94";
static const char sel_border[] = "#cdbfdd";

static const char urg_fg[] = "#cdbfdd";
static const char urg_bg[] = "#513A85";
static const char urg_border[] = "#513A85";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
