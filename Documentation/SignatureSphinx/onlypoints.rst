.. _chapter_onlypoints:

Only points
============

.. csv-table:: Points-only; predicate symbols (1/4)
   :header: "ADGLib"# "LaTeX notation"# "Intuitive meaning"# "Definition"
   :widths: 20, 20, 40, 60
   :delim: #

    "between(A,B,C)"#""#"points $A$, $B$ and $C$ are collinear and $B$ is strictly between $A$ and $C$"#
    "betweenNonStrict(A,B,C)"#"$\bT{A}{B}{C}$"#"points $A$, $B$ and $C$ are collinear and $B$ is between $A$ and $C$, it can be the case the $A=B$ or $B=C$."#""
    "between4(A,B,C,D)"#""#"points $A$, $B$ $C$ and $D$ are collinear distinct and in this order."#
    "centroid(H,A,B,C)"#""#"$H$ is the centroid/gravity center of triangle $ABC$."#
    "circumcenter(G,A,B,C)"#""#"$G$ is the circum-center of triangle $ABC$."#
    "collinear(A,B,C)"#"$\col{A}{B}{C}$"#"points $A$, $B$ and $C$ are collinear"#"$ \bT{A}{B}{C} \lor \bT{B}{A}{C} \lor \bT{A}{C}{B} $"
    "concyclic(A,B,C,D)"#""#"$A$, $B$, $C$ and $D$ belong to the same circle"#"$Coplanar A B C D \land \exists O\; \congT{OA}{OB} \land \congT{OA}{OC}  \land \congT{OA}{OD} $"
    "congruent(A,B,C,D)"#"$\congT{AB}{CD}$"#"the segments $AB$ and $CD$ are congruent (intuitively in the sense that they have same length, but length measure is not assumed to exist)"#
    "congruentAngles(A,B,C,D,E,F)}"#"$ \conga{A}{B}{C}{D}{E}{F} $"#"the angles $\angle{ABC}$ and $\angle{DEF}$ are congruent"#"$ A \neq B \land C \neq B \land D \neq E \land F \neq E \land $ \n $ \exists A', \exists C', \exists D', \exists F',  \bT{B}{A}{A'} \land \congT {AA'}{ED} \land $ \n $ \bT {B}{C}{C'} \land \congT {CC'}{EF} \land  \bT {E}{D}{D'} \land \congT {DD'}{BA} \land $ \n $ \bT {E}{F}{F'} \land \congT {FF'}{BC} \land  \congT {A'C'}{D'F'} $"
    "congruentCircles(O,P,O',P')"#""#"the two circles are congruent."#
    "congruentTriangles(A,B,C,A',B',C')"#""#"$ABC$ is congruent to $A'B'C'$"#"$ \congT{AB}{A'B'} \land \congT{AC}{A'C'} \land \congT{BC}{B'C'} $"
    "congruentRectangles(A,B,C,D,A',B',C',D')"#""#"$ABCD$  and $A'B'C'D'$ are congruent rectangles"#"$ \congT{AB}{A'B'} \land \congT{BC}{B'C'} \land Rectangle(A,B,C,D) \land Rectangle(A',B',C',D') $"
    "diameter(A,B,O,P)"#""#"$AB$ is a diameter of the circle of center $O$ going through $P$."#
    "equilateral(A,B,C)"#""#"$ABC$ is an equilateral triangle"#"$\congT{AB}{BC} \land \congT{BC}{CA}$"
    "equilateralStrict(A,B,C)"#""#"$ABC$ is an equilateral triangle and the points are distinct and hence not collinear"#"$equilateral A B C \land A \neq B$"
    "harmonic(A,B,C,D)"#""#"Points $A$, $B$, $C$, $D$ are on the same line and $AC/CB=DA/DB$."#
    "incenter(G,A,B,C)"#""#"$G$ is the in-center of triangle $ABC$."#

