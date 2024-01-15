const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#05870A", /* black   */
  [1] = "#5D5752", /* red     */
  [2] = "#8AD072", /* green   */
  [3] = "#0A9B50", /* yellow  */
  [4] = "#156965", /* blue    */
  [5] = "#2D6B69", /* magenta */
  [6] = "#103D99", /* cyan    */
  [7] = "#8fd4d3", /* white   */

  /* 8 bright colors */
  [8]  = "#649493",  /* black   */
  [9]  = "#5D5752",  /* red     */
  [10] = "#8AD072", /* green   */
  [11] = "#0A9B50", /* yellow  */
  [12] = "#156965", /* blue    */
  [13] = "#2D6B69", /* magenta */
  [14] = "#103D99", /* cyan    */
  [15] = "#8fd4d3", /* white   */

  /* special colors */
  [256] = "#05870A", /* background */
  [257] = "#8fd4d3", /* foreground */
  [258] = "#8fd4d3",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
