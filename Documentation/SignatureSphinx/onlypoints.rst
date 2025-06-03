.. _chapter_onlypoints:

Only points
============

.. csv-table:: 
   :header: "ADGLib"# "LaTeX notation"# "Intuitive meaning"# "Definition"
   :widths: 20, 20, 60, 60
   :delim: #

    "between(A,B,C)"#""#"points :math:`A`, :math:`B` and :math:`C` are collinear and :math:`B` is strictly between :math:`A` and :math:`C`"#
    "betweenNonStrict(A,B,C)"#":math:`\betweenNonStrict{A}{B}{C}`"#"points :math:`A`, :math:`B` and :math:`C` are collinear and :math:`B` is between :math:`A` and :math:`C`, it can be the case the :math:`A=B` or :math:`B=C`."#""
    "centroid(H,A,B,C)"#""#":math:`H` is the centroid of triangle :math:`ABC`"#
    "circumcenter(G,A,B,C)"#""#":math:`G` is the circum-center of the points :math:`ABC`"#
    "collinear(A,B,C)"#":math:`\collinear{A}{B}{C}`"#"points :math:`A`, :math:`B` and :math:`C` are collinear"#":math:`\betweenNonStrict{A}{B}{C} \lor \betweenNonStrict{B}{A}{C} \lor \betweenNonStrict{A}{C}{B}`"
    "concyclic(A,B,C,D)"#""#":math:`A`, :math:`B`, :math:`C` and :math:`D` belong to the same circle (possibly degenerated)"#":math:`Coplanar A B C D \land \exists O\; \congruentSegments{OA}{OB} \land \congruentSegments{OA}{OC}  \land \congruentSegments{OA}{OD}`"
    "congruent(A,B,C,D)"#":math:`\congruentSegments{AB}{CD}`"#"the segments :math:`AB` and :math:`CD` are congruent (intuitively in the sense that they have same length, but length measure is not assumed to exist)"#
    "congruentAngles(A,B,C,D,E,F)}"#":math:`\congruentAngles{A}{B}{C}{D}{E}{F}`"#"the angles :math:`\angle{ABC}` and :math:`\angle{DEF}` are congruent"#":math:`A \neq B \land C \neq B \land D \neq E \land F \neq E \land \land \exists A', \exists C', \exists D', \exists F',  \betweenNonStrict{B}{A}{A'} \land \congruentSegments {AA'}{ED} \land \betweenNonStrict {B}{C}{C'} \land \congruentSegments {CC'}{EF} \land  \betweenNonStrict {E}{D}{D'} \land \congruentSegments {DD'}{BA} \land \betweenNonStrict {E}{F}{F'} \land \congruentSegments {FF'}{BC} \land  \congruentSegments {A'C'}{D'F'}`"
    "congruentCircles(O,P,O',P')"#""#"the two circles (or sphere) are congruent."#:math:`\congruentSegments{OP}{O'P'}`"
    "congruentTriangles(A,B,C,A',B',C')"#""#":math:`ABC` is congruent to :math:`A'B'C'`"#":math:`\congruentSegments{AB}{A'B'} \land \congruentSegments{AC}{A'C'} \land \congruentSegments{BC}{B'C'}`"
    "congruentRectangles(A,B,C,D,A',B',C',D')"#""#":math:`ABCD`  and :math:`A'B'C'D'` are congruent rectangles"#":math:`\congruentSegments{AB}{A'B'} \land \congruentSegments{BC}{B'C'} \land Rectangle(A,B,C,D) \land Rectangle(A',B',C',D')`"
    "diameter(A,B,O,P)"#""#":math:`AB` is a diameter of the circle of center :math:`O` going through :math:`P`"#
    "equilateral(A,B,C)"#""#":math:`ABC` is an equilateral triangle"#":math:`\congruentSegments{AB}{BC} \land \congruentSegments{BC}{CA}`"
    "equilateralNdg(A,B,C)"#""#":math:`ABC` is an equilateral triangle and the points are distinct and hence not collinear"#":math:`equilateral A B C \land A \neq B`"
    "harmonic(A,B,C,D)"#""#"Points :math:`A`, :math:`B`, :math:`C`, :math:`D` are on the same line and :math:`AC/CB=DA/DB`"#
    "incenterNdg(G,A,B,C)"#""#":math:`G` is the in-center of triangle :math:`ABC`"#
    "insideCircleStrict(C,O,P)"#""#":math:`C` is strictly inside or on circle (or sphere) of center :math:`O` going through :math:`P`"#
    "insideCircle(C,O,P)"#" "#":math:`C` is inside the circle (or sphere) of center :math:`O` going through :math:`P`"#
    "insideAngle(P,A,B,C)"#":math:`\insideAngle{P}{A}{B}{C}`"#"the point :math:`P` is inside the angle :math:`\angle{ABC}`"#":math:`A \neq B \land C \neq B \land P \neq B \land \exists X, \betweenNonStrict{A}{X}{C} \land (X = B \lor out{B}{X}{P})`"
    "intersectionLineLine(X,A,B,C,D)}"#""#":math:`X` is the intersection of lines :math:`AB` and :math:`CD`"#
    "intersectionLineSegment(X,A,B,C,D)"#""#":math:`X` is the intersection of line :math:`AB` and segment :math:`CD`"#
    "intersectionLineCircle(X,Y,A,B,O,P)"#""#":math:`X` and :math:`Y` are the intersections of line :math:`AB` and circle :math:`OP`"#
    "intersectionSegmentSegment(X,A,B,C,D)"#""#":math:`X` is the intersection of segments :math:`AB` and :math:`CD`"#
    "intersectionCircleCircle(X,Y,O,P,O',P')"#""#":math:`X` and :math:`Y` are the intersections of circles :math:`OP`` and :math:`O'P'`."#
    "isosceles(A,B,C)"#""#":math:`ABC` is an isosceles triangle in :math:`B`, points may be equal."#":math:`\congruentSegments{AB}{BC}`"
    "isoscelesStrict(A,B,C)"#""#":math:`ABC` is an isosceles triangle in :math:`B`, points are not collinear."#":math:`\congruentSegments{AB}{BC} \land \lnot \collinear{A}{B}{C}`"
    "kite(A,B,C,D)"#""#":math:`ABCD` is a kite"#
    "lambert(A,B,C,D)"#""#":math:`ABCD` is a quadrilateral with three right angles. In hyperbolic geometry the fourth angle is acute, in Euclidean geometry it is a right angle."#":math:`A\neq B \land B \neq C \land C \neq D \land A \neq D \land \rightAngle{B}{A}{D} \land \rightAngle{A}{D}{C} \land \rightAngle{A}{B}{C}`"
    "midpoint(M,A,B)"#""#":math:`M` is the midpoint of segment :math:`AB`"#":math:`\betweenNonStrict{A}{M}{B} \land \congruentSegments{A M}{B M}`"
    "onAngleBisector(P,A,O,B)"#""#":math:`P` belongs to the bisector of angle :math:`AOB`"#" :math:`P \neq O \land \angle{AOP}` and :math:`\angle{POB}` are congruent"
    "onCircle(C,O,P)}"#""#":math:`C` is on circle (or sphere) of center :math:`O` going through :math:`P`"#
    "onLine(P,A,B)"#""#"points :math:`P` is on line :math:`AB` (:math:`A\neq B`)"#
    "onParallel(P,B,C,D)"#""#":math:`P` is on the parallel to line :math:`CD` through :math:`B`"#":math:`\parallelADG{A}{B}{C}{D} \land C \neq D`"
    "onPerpendicularBisector(P,A,B)"#""#":math:`P` belongs to the perpendicular bisector of segment :math:`AB`"#":math:`P \neq midpoint(A,B)` and :math:`\congruentSegments{PA}{PB}`"
    "onRay(O,A,B)"#":math:`out{O}{A}{B}`"#":math:`B` belongs to the half line :math:`OA`"#":math:`O \neq A \land O  \neq B \land (\betweenNonStrict{O}{A}{B} \lor \betweenNonStrict{O}{B}{A})`"
    "oppositeSides(A,B,P,Q)"#":math:`tS{A}{B}{P}{Q}`"# :math:`P` and :math:`Q` are on different sides of line :math:`AB` # :math:`\lnot \collinear{P}{A}{B} \land \lnot \collinear{Q}{A}{B} \land \exists T, \collinear{T}{A}{B} \land \betweenNonStrict{P}{T}{Q}`
    "outsideCircle(C,O,P)"#""#":math:`C` is on or outside the circle (or sphere) of center :math:`O` going through :math:`P`"
    "outsideCircleStrict(C,O,P)"#""#":math:`C` is strictly outside the circle (or sphere) of center :math:`O` going through :math:`P`"
    "meetLineLine(A,B,C,D)"#""#"The lines :math:`AB` and :math:`CD` intersect"
    "meetLineSegment(A,B,C,D)"#""#"The segment :math:`AB` and segment :math:`CD` intersect" 
    "orthocenter(H,A,B,C)"#""#":math:`H` is the ortho-center of triangle :math:`ABC`"#
    "perpendicular(A,B,C,D)"#":math:`\perpendicular{A}{B}{C}{D}`"#"line :math:`AB` is perpendicular to line :math:`CD` (:math:`A\neq B` and :math:`C\neq D`)"
    "perpendicularAt(P,A,B,C,D)"#":math:`\perpendicularAt{P}{A}{B}{C}{D}`"#"line :math:`AB` is perpendicular to line :math:`CD` at point :math:`P`"#":math:`\collinear{P}{A}{B} \land \collinear{P}{C}{D} \land (\forall U, V, \collinear{U}{A}{B} \Rightarrow \collinear{V}{C}{D} \Rightarrow \perpendicular{U}{P}{V})`"
.. :math:`perpin{A B}{C D}{P}$ # 
.. $AB \bot CD$ and math:`P` is the intersection of math:`AB` and math:`CD` # 
.. $A \neq B \; \land \; C \neq D \; \land \; \col {P} {A} {B} \; \land \; \col {P} {C} {D} \; \land \; 
.. (\forall U \, V, \col {U} {A} {B} \imp \col {V} {C} {D} \imp \per{U}{P}{V})$ \\
.. \addlinespace
.. perpendicular2(A,B,C,D,P) # 
.. :math:`perpTwo{A B}{C D}{P}$ # 
.. the line math:`AB` and math:`CD` have a common perpendicular through math:`P` # 
.. $ \exists X, \exists Y, \col{P}{X}{Y} \land \perpT{XY}{AB} \land \perpT{XY}{CD} $ \\
.. \addlinespace
..  parallel(A,B,C,D)} # 
.. $ \para{A B}{C D} $ # 
.. line math:`AB` is parallel to line math:`CD` # 
.. $ \spara{A B}{C D} \lor (A \neq B \land C \neq D \land \col{A}{C}{D} \land \col{B}{C}{D}) $ \\
.. \addlinespace
.. parallelNonStrict(A,B,C,D) # 
..  # 
.. line math:`AB` is parallel to line math:`CD` or math:`A=B` or math:`C=D` # 
.. $ \para{A B}{C D} \lor (A=B \lor C=D) $ \\
.. parallelNonReflexive(A,B,C,D) # 
.. :math:`spara{A B}{C D} $ # 
.. line math:`AB` is parallel to line math:`CD` and :math:`AB \neq CD`` # 
.. $A \neq B \land C \neq D \land \cp{A}{B}{C}{D} \land \lnot \exists X, \col{X}{A}{B} \land \col{X}{C}{D} $ \\
.. \addlinespace
.. verticalAngles(A,B,C,D,E,F) # 
..  # 
.. math:`ABC` and $DEF$ are vertical angles # 
.. $ B=E \land \bH{A}{B}{D} \land \bH{C}{B}{F} $ \\
.. parallelogram(A,B,C,D) # 
.. # 
.. $ABCD$ is a parallelogram, this includes a flat case defined as diagonals intersect in their midpoint # 
.. $Parallelogram\_strict \, A \, B \, A' \, B' \; \lor \; Parallelogram\_flat \, A \, B \, A' \, B'$ \\
.. parallelogramNdg(A,B,C,D) # 
.. # 
.. $ABCD$ is a parallelogram. The points are not collinear # 
.. :math:`oS {A} {A'} {B} {B'} \; \land \; AB \parallel A'B' \; \land \; \congT{AB}{A'B}'$ \\
.. parallelogramFlat(A,B,C,D) # 
.. # 
.. $ABCD$ is a flat parallelogram #
.. $ \col {A} {B} {A'} \; \land \; \col {A} {B} {B'} \; \land \congT {AB} {A'B}' \; \land \; \congT {AB'} {A'B} \; \land \; (A \neq A' \; \lor \; B \neq B') $ \\

