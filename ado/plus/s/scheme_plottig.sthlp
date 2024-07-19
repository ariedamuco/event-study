{smcl}
{* *! version 1.0.0 24dec2014}{...}
{cmd:help scheme plottig}, {cmd:help scheme plottigblind}{right: ({browse "http://www.stata-journal.com/article.html?article=gr0070":SJ17-3: gr0070})}
{hline}

{title:Title}

{p2colset 5 23 25 2}{...}
{p2col:{hi:scheme plottig} {hline 2}}Scheme description: plottig and plottigblind{p_end}
{p2colreset}{...}


{* index schemes}{...}
{title:Syntax}

	{it:schemename}{col 25}Foreground{col 38}Background{col 50}Description
	{hline 80}
	{cmd:plottig}{...}
{col 25}color{...}
{col 38}white{...}
{col 50}colors on gray
	{cmd:plottigblind}{...}
{col 25}color{...}
{col 38}white{...}
{col 50}colorblind friendly colors on gray
	{hline 80}

{pstd}
For instance, you might type

{p 8 16 2}
{cmd:. graph}
...{cmd:,}
...
{cmd:scheme(plottig)}

{p 8 16 2}
{cmd:. set}
{cmd:scheme} 
{cmd: plottig}
[{cmd:,}
{cmdab:perm:anently}]

{pstd}
See {manhelpi scheme_option G-3} and {manhelp set_scheme G-2:set scheme}.


{title:Description}

{p 4 4 2}
Schemes determine the overall look of a graph; see
{manhelp schemes G-4:schemes intro}.

{p 4 4 2}
Scheme {cmd:plottig} uses 14 new colors and a gray background.  It heavily
relies on the insights from Cleveland (1994) and on the {cmd:ggplot} scheme
for the statistical software R.

{p 4 4 2}
Scheme {cmd:plottigblind} relies on the same design as {cmd:plottig} but
instead uses seven colors that are distinguishable for colorblind people and
have been introduced in {helpb scheme plotplainblind}.


{title:Remarks}

{p 4 4 2}
Schemes {cmd:plottig} and {cmd:plottigblind} have a gray background tinting,
and y-axis labels are horizontal.  Gridlines are white, medium sized, and
drawn for the x and y axes.  The x and y axes are not plotted.  Markers,
lines, and label fonts are medium.  Legends are not framed, appear on the
right-hand side of the figure, have medium-large keylabels, and rely on rows
first.  The intensity of pie and bar figures is reduced to 50.  Borderlines of
histograms and bars are thin.  Marker symbols are reordered to ensure that
points in scatters are less often overlapping.

{p 4 4 2}
In addition to the above, {cmd:plottigblind} introduces 14 new colors to
Stata. Inspiration for the colors comes from 
{browse "http://colorbrewer.org/"} and the {cmd:ggplot} package.  Thus, they
can be used like any other color in Stata, for example,

{p 8 16 2}
{cmd:. line x y, lcolor(plr1)}
 
{p 4 4 2}
The 14 colors are {cmd:plr1}, {cmd:plr2}, {cmd:plb1}, {cmd:plb2}, {cmd:plb3},
{cmd:plg1}, {cmd:plg2}, {cmd:plg3}, {cmd:pll1}, {cmd:pll2}, {cmd:pll3},
{cmd:ply1}, {cmd:ply2}, and {cmd:ply3}.

{p 4 4 2}
More details on the schemes may be found in Bischof (2017).


{title:References}

{phang}
Bischof, D. 2017. {browse "http://www.stata-journal.com/article.html?article=gr0070":New graphic schemes for Stata: plotplain and plottig}. 
{it:Stata Journal} 17: 748-759.

{phang}
Cleveland, W. S. 1994. {it:The Elements of Graphing Data}. Rev. ed. Summit, NJ: Hobart.


{title:Author}

{p 4 4 2}
Daniel Bischof{break}
Department of Political Science{break}
University of Zurich{break}
Zurich, Switzerland{break}
bischof@ipz.uzh.ch


{title:Also see}

{p 7 14 2}Help:  {manhelp schemes_intro G-4:schemes intro}, {manhelp scheme_option G-3:{it:scheme_option}}, {manhelp set_scheme G-2:set scheme}

{p 4 14 2}Article:  {it:Stata Journal}, volume 17, number 3: {browse "http://www.stata-journal.com/article.html?article=gr0070":gr0070}{p_end}
