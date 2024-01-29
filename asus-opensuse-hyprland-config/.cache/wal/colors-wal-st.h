const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0a080b", /* black   */
  [1] = "#513A85", /* red     */
  [2] = "#6F5A94", /* green   */
  [3] = "#9B6EA5", /* yellow  */
  [4] = "#C87BA1", /* blue    */
  [5] = "#B187BC", /* magenta */
  [6] = "#D68EB4", /* cyan    */
  [7] = "#cdbfdd", /* white   */

  /* 8 bright colors */
  [8]  = "#8f859a",  /* black   */
  [9]  = "#513A85",  /* red     */
  [10] = "#6F5A94", /* green   */
  [11] = "#9B6EA5", /* yellow  */
  [12] = "#C87BA1", /* blue    */
  [13] = "#B187BC", /* magenta */
  [14] = "#D68EB4", /* cyan    */
  [15] = "#cdbfdd", /* white   */

  /* special colors */
  [256] = "#0a080b", /* background */
  [257] = "#cdbfdd", /* foreground */
  [258] = "#cdbfdd",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
