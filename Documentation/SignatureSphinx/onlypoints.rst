.. _chapter_onlypoints:

Only points
============

.. csv-table:: Points-only; predicate symbols (1/4)
   :header: "ADGLib"# "LaTeX notation"# "Intuitive meaning"# "Definition"
   :widths: 20, 20, 40, 60
   :delim: #

    "between(A,B,C)"#""#"points :math:`A`, :math:`B` and :math:`C` are collinear and :math:`B` is strictly between :math:`A` and :math:`C`"#
    "betweenNonStrict(A,B,C)"#"$\bT{A}{B}{C}$"#"points :math:`A`, :math:`B` and :math:`C` are collinear and :math:`B` is between :math:`A` and :math:`C`, it can be the case the $A=B$ or $B=C$."#""
    "between4(A,B,C,D)"#""#"points :math:`A`, :math:`B` :math:`C` and :math:`D` are collinear distinct and in this order."#
    "centroid(H,A,B,C)"#""#":math:`H` is the centroid/gravity center of triangle :math:`ABC`."#
    "circumcenter(G,A,B,C)"#""#":math:`G` is the circum-center of triangle :math:`ABC`."#
    "collinear(A,B,C)"#"$\col{A}{B}{C}$"#"points :math:`A`, :math:`B` and :math:`C` are collinear"#":math:`\bT{A}{B}{C} \lor \bT{B}{A}{C} \lor \bT{A}{C}{B}`"
    "concyclic(A,B,C,D)"#""#":math:`A`, :math:`B`, :math:`C` and :math:`D` belong to the same circle"#"$Coplanar A B C D \land \exists O\; \congT{OA}{OB} \land \congT{OA}{OC}  \land \congT{OA}{OD} $"
    "congruent(A,B,C,D)"#"$\congT{AB}{CD}$"#"the segments :math:`AB` and :math:`CD` are congruent (intuitively in the sense that they have same length, but length measure is not assumed to exist)"#
    "congruentAngles(A,B,C,D,E,F)}"#"$ \conga{A}{B}{C}{D}{E}{F} $"#"the angles :math:`\angle{ABC}` and :math:`\angle{DEF}` are congruent"#":math:` A \neq B \land C \neq B \land D \neq E \land F \neq E \land $ \n $ \exists A', \exists C', \exists D', \exists F',  \bT{B}{A}{A'} \land \congT {AA'}{ED} \land $ \n $ \bT {B}{C}{C'} \land \congT {CC'}{EF} \land  \bT {E}{D}{D'} \land \congT {DD'}{BA} \land $ \n $ \bT {E}{F}{F'} \land \congT {FF'}{BC} \land  \congT {A'C'}{D'F'}`"
    "congruentCircles(O,P,O',P')"#""#"the two circles are congruent."#
    "congruentTriangles(A,B,C,A',B',C')"#""#":math:`ABC` is congruent to :math:`A'B'C'`"#"$ \congT{AB}{A'B'} \land \congT{AC}{A'C'} \land \congT{BC}{B'C'} $"
    "congruentRectangles(A,B,C,D,A',B',C',D')"#""#":math:`ABCD`  and :math:`A'B'C'D'` are congruent rectangles"#"$ \congT{AB}{A'B'} \land \congT{BC}{B'C'} \land Rectangle(A,B,C,D) \land Rectangle(A',B',C',D') $"
    "diameter(A,B,O,P)"#""#":math:`AB` is a diameter of the circle of center :math:`O` going through :math:`P`."#
    "equilateral(A,B,C)"#""#":math:`ABC` is an equilateral triangle"#":math:`\congT{AB}{BC} \land \congT{BC}{CA}`"
    "equilateralStrict(A,B,C)"#""#":math:`ABC` is an equilateral triangle and the points are distinct and hence not collinear"#":math:`equilateral A B C \land A \neq B`"
    "harmonic(A,B,C,D)"#""#"Points :math:`A`, :math:`B`, :math:`C`, :math:`D` are on the same line and :math:`AC/CB=DA/DB`."#
    "incenter(G,A,B,C)"#""#":math:`G` is the in-center of triangle :math:`ABC`."#
    "insideCircle(C,O,P)"#""#":math:`C` is strictly inside or on circle (or sphere) of center :math:`O` going through :math:`P`"#
    "insideCircleNonStrict(C,O,P)"#""#":math:`C` is inside the circle (or sphere) of center :math:`O` going through :math:`P`"#
..    "insideAngle(P,A,B,C)"#"$ inangleT{P}{A}{B}{C} $"#"the point :math:`P` is inside the angle $angle{ABC}$"#"$A neq B land C \neq B \land P \neq B \land \exists X, \bT{A}{X}{C} \land$\n" "" "" ""#"$ (X = B \lor \out{B}{X}{P}) $"

.. "{\bf intersectionLineLine(X,A,B,C,D)}"#""#"$X$ is the intersection of lines :math:`AB` and :math:`CD`"#
.. "intersectionLineSegment(X,A,B,C,D)"#""#"$X$ is the intersection of line :math:`AB` and segment :math:`CD`"#
.. "{\bf intersectionLineCircle(X,Y,A,B,O,P)}"#""#"$X$ and $Y$ are the intersections of line :math:`AB` and circle $OP$"#
.. "intersectionSegmentSegment(X,A,B,C,D)"#""#"$X$ is the intersection of segments :math:`AB` and :math:`CD`"#
.. "{\bf intersectionCircleCircle(X,Y,O,P,O',P')}"#""#"$X$ and $Y$ are the intersections of circles $OP$ and $O'P'$."#
.. "isosceles(A,B,C)"#""#":math:`ABC` is an isosceles triangle in :math:`B`, points may be equal."#"$\congT{AB}{BC}$"
.. "isoscelesStrict(A,B,C)"#""#":math:`ABC` is an isosceles triangle in :math:`B`, points are not collinear."#"$\congT{AB}{BC} \land \lnot \col{A}{B}{C} $"
.. "kite(A,B,C,D)"#""#":math:`ABCD` is a kite"#
.. "lambert(A,B,C,D)"#""#":math:`ABCD` is a quadrilateral with three right angles. In hyperbolic geometry the fourth angle is acute, in Euclidean geometry it is a right angle."#"$A\neq B \land B \neq C \land C \neq D \land A \neq D \land \per{B}{A}{D} \land \per{A}{D}{C} \land \per{A}{B}{C} $"
.. "{\bf midpoint(M,A,B)}"#"$\midpoint{A}{M}{B}$"#"$M$ is the midpoint of segment :math:`AB`"#"$\bT{A}{M}{B} \land \congT{A M}{B M} $"
.. "{\bf onAngleBisector(P,A,O,B)}"#""#":math:`P` belongs to the bisector of angle $AOB$"#"$P \neq O \land \angle{AOP}$ and $\angle{POB}$ are congruent"
.. "{\bf onCircle(C,O,P)}"#""#":math:`C` is on circle (or sphere) of center :math:`O` going through :math:`P`"#
.. "{\bf onLine(P,A,B)}"#""#"points :math:`P` is on line :math:`AB` ($A\neq B$)"#
.. "{\bf onParallel(P,B,C,D)}"#""#":math:`P` is on the parallel to line :math:`CD` through :math:`B`"#"$ \para{A B}{C D} \land C \neq D $"
.. "{\bf onPerpendicularBisector(P,A,B)}"#""#":math:`P` belongs to the perpendicular bisector of segment :math:`AB`"#"$P \neq midpoint(A,B)$ and $\congT{PA}{PB}$"
.. "{\bf onRay(O,A,B)}"#"$\out{O}{A}{B}$"#":math:`B` belongs to the half line $OA$"#"$ O \neq A \land O  \neq B \land (\bT{O}{A}{B} \lor \bT{O}{B}{A}) $"