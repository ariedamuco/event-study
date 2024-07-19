{smcl}
{* *! version 1.0.0 24dec2014}{...}
{cmd:help scheme plotplain}, {cmd:help scheme plotplainblind}{right: ({browse "http://www.stata-journal.com/article.html?article=gr0070":SJ17-3: gr0070})}
{hline}

{title:Title}

{p2colset 5 25 27 2}{...}
{p2col:{hi:scheme plotplain} {hline 2}}Scheme description: plotplain and plotplainblind{p_end}
{p2colreset}{...}


{* index schemes}{...}
{title:Syntax}

    {it:schemename}{col 22}Foreground{col 35}Background{col 48}Description
    {hline 78}
    {cmd:plotplain}{...}
{col 22}black{...}
{col 35}white{...}
{col 48}black on white
    {cmd:plotplainblind}{...}
{col 22}color{...}
{col 35}white{...}
{col 48}colorblind friendly colors on white
    {hline 78}

{pstd}
For instance, you might type

{p 8 16 2}
{cmd:. graph}
...{cmd:,}
...
{cmd:scheme(plotplain)}

{p 8 16 2}
{cmd:. set}
{cmd:scheme} 
{cmd: plotplain}
[{cmd:,}
{cmdab:perm:anently}]

{pstd}
See {manhelpi scheme_option G-3} and {manhelp set_scheme G-2:set scheme}.


{title:Description}

{p 4 4 2}
Schemes determine the overall look of a graph; see 
{manhelp schemes G-4:schemes intro}.

{p 4 4 2}
Scheme {cmd:plotplain} uses shades of gray and shapes of lines to distinguish
plotted subgroups in a figure. 

{p 4 4 2}
Scheme {cmd:plotplainblind} relies on the same design as {cmd:plotplain} but
introduces seven new colors that should also be distinguishable for colorblind
people. 


{title:Remarks}

{p 4 4 2}
Schemes {cmd:plotplain} and {cmd:plotplainblind} have no background tinting,
and y-axis labels are horizontal.  Gridlines are thin dots that are drawn for
the x and y axes.  Axis lines end with the last label marker and start with
the first label marker, and x and y axes are gray.  Markers are all small.
Lines are medium thin.  Label fonts are small.  Legends are not framed, appear
on the right-hand side of the figure, have medium-large keylabels, and rely on
rows first.  Plot regions are omitted.  The intensity of pie and bar figures
is reduced to 50.  Borderlines of histograms and bars are thin.  Marker
symbols are reordered to ensure that points in scatters overlap less often.

{p 4 4 2}
In addition to the above, {cmd:plotplainblind} introduces seven new colors to
Stata.  Furthermore, the scheme uses only these seven colors in case figures
are drawn for more than two subgroups.  If the user specifies only that the
figure should be plotted across two subgroups, one group will appear in black
and the other group in gray.  All colors are chosen to be distinguishable for
colorblind people.  Colorblindness is not a total loss of color vision;
colorblind people can recognize many colors.  However, certain ranges of
colors are hard to distinguish (see Okabe and Ito [2002]).  After one installs
{cmd:plotplainblind}, the seven colors are also available in the default Stata
color palette.  Thus, they can be used like any other color in Stata, for
example, 

{p 8 16 2}
{cmd:. line x y, lcolor(reddish)}
 
{p 4 4 2}
The seven colors are {cmd:ananas}, {cmd:sky}, {cmd:turquoise}, {cmd:reddish},
{cmd:vermillion}, {cmd:sea}, and {cmd:orangebrown}.

{p 4 4 2}
More details on the schemes may be found in Bischof (2017).


{title:References}

{phang}
Bischof, D. 2017. {browse "http://www.stata-journal.com/article.html?article=gr0070":New graphic schemes for Stata: plotplain and plottig}.
{it:Stata Journal} 17: 748-759.

{phang}
Okabe, M., and K. Ito. 2002. Color universal design (CUD) -- How to make figures and presentations that are friendly to colorblind people. {browse "http://jfly.iam.u-tokyo.ac.jp/color/"}


{title:Author}

{p 4 4 2}
Daniel Bischof{break}
Department of Political Science{break}
University of Zurich{break}
Zurich, Switzerland{break}
bischof@ipz.uzh.ch


{title:Also see}

{p 4 14 2}Article:  {it:Stata Journal}, volume 17, number 3: {browse "http://www.stata-journal.com/article.html?article=gr0070":gr0070}{p_end}

{p 7 14 2}Help:  {manhelp schemes_intro G-4:schemes intro},
{manhelp scheme_option G-3:{it:scheme_option}},
{manhelp set_scheme G-2:set scheme}{p_end}
