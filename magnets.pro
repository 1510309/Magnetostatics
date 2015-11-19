/* --------------------------------------------------------------------------
                         GetDP problem definition file                           

   -------------------------------------------------------------------------- */

/* 
   To run the program  use :
                 
                   $ "getdp magnets.pro  -pre -cal -pos"     
*/

/* -------------------------------------------------------------------------

  Input

  Groups :
  --------
    Omega         Whole magnetic domain
    Magnet        Permanent magnet regions 

  Functions :
  -----------
    mu[]          Magnetic permeability
    nu[]          Magnetic reluctivity
    hc[]          Coercitive magnetic field

  Constraint :   
  ----------
    phi           Fixed magnetic scalar potential

  Properties of Neodymium Permanent Magnets :
  ------------------------------------------
    

  ------------------------------------------------------------------------- */

Group {
	
	/* The numbers correspond to physical regions defined in 'test.geo' (the input 
	 to the GMSH meshing tool) */
	
  Air     = Region[ 608 ];
  Mag1     = Region[ 600 ];
  Mag2     = Region[ 601 ];
  Mag3     = Region[ 602 ];
  Mag4     = Region[ 603 ];
  Mag5     = Region[ 604 ];
  Mag6     = Region[ 605 ];
  Mag7     = Region[ 606 ];
  Mag8     = Region[ 607 ];


  Bound   = Region[ 1000 ];				// System boundaries

  Omega   = Region[ { Air, Mag1, Mag2, Mag3, Mag4, Mag5, Mag6, Mag7, Mag8 } ];
  Magnet1  = Region[ { Mag1 } ];
  Magnet2  = Region[ { Mag2 } ];
  Magnet3  = Region[ { Mag3 } ];
  Magnet4  = Region[ { Mag4 } ];
  Magnet5  = Region[ { Mag5 } ];
  Magnet6  = Region[ { Mag6 } ];
  Magnet7  = Region[ { Mag7 } ];
  Magnet8  = Region[ { Mag8 } ];

}

/* Constants */

Function {

  mu0     = 4.e-7 * Pi ;		// Permeability
  mu[ Magnet1 ] = 1.05 * mu0;
  mu[ Magnet2 ] = 1.05 * mu0;
  mu[ Magnet3 ] = 1.05 * mu0;
  mu[ Magnet4 ] = 1.05 * mu0;
  mu[ Magnet5 ] = 1.05 * mu0;
  mu[ Magnet6 ] = 1.05 * mu0;
  mu[ Magnet7 ] = 1.05 * mu0;
  mu[ Magnet8 ] = 1.05 * mu0;

  mu[ Air ]	= mu0;
  
  nu[ Magnet1 ]  = 1.0 / (1.05 * mu0) ;
  nu[ Magnet2 ]  = 1.0 / (1.05 * mu0) ;
  nu[ Magnet3 ]  = 1.0 / (1.05 * mu0) ;
  nu[ Magnet4 ]  = 1.0 / (1.05 * mu0) ;
  nu[ Magnet5 ]  = 1.0 / (1.05 * mu0) ;
  nu[ Magnet6 ]  = 1.0 / (1.05 * mu0) ;
  nu[ Magnet7 ]  = 1.0 / (1.05 * mu0) ;
  nu[ Magnet8 ]  = 1.0 / (1.05 * mu0) ;

  nu[ Air ]		= 1.0 / mu0;

  hc[ Magnet1 ]  = Vector[ 0., 0., -903000. ];
  hc[ Magnet2 ]  = Vector[ 0., 0.,  903000. ];
  hc[ Magnet3 ]  = Vector[ 0., 0.,  903000. ];
  hc[ Magnet4 ]  = Vector[ 0., 0., -903000. ];
  hc[ Magnet5 ]  = Vector[ 0., 0., -903000. ];
  hc[ Magnet6 ]  = Vector[ 0., 0.,  903000. ];
  hc[ Magnet7 ]  = Vector[ 0., 0.,  903000. ];
  hc[ Magnet8 ]  = Vector[ 0., 0., -903000. ];

}


//
// Boundary Conditions
//

Constraint {
    { Name phi; 
       Case {
	   { Region Bound; Value 0.0; }
    	}
  	}
}

/*  Governing Equations */

Include "magnets_ms.pro"

/*  Post Processing */

eps = 1.e-8 ;

PostOperation {
	{ Name phi; NameOfPostProcessing MagSta_phi;
		Operation {

	   Print[ b,   OnElementsOf Omega,  File "b.pos" ];
           Print[ h,   OnElementsOf Omega,  File "h.pos" ];
           Print[ phi, OnElementsOf Omega,  File "phi.pos" ];

//           Print[ phi, OnPlane { {-0.0015, -0.006,0} { 0.00921,-0.006,0} {-0.0015, 0.006,0}} {20,20}, File "b0.pos" ];
//           Print[ b, OnLine { {0.00239, 0.003,0} { 0.00743,0.003,0} } {11}, Format SimpleTable ,File "b1.pos" ];
//           Print[ b, OnLine { {0.00239, 0.0,0} { 0.00743,0.0,0} } {11}, Format SimpleTable ,File "b2.pos" ];
//           Print[ b, OnLine { {0.00239, -0.003,0} { 0.00743,-0.003,0} } {11}, Format SimpleTable, File "b3.pos" ];

           Print[ b, OnBox { {-0.02, -0.02, -0.01} {0.02, -0.02, -0.01} {-0.02, 0.02, -0.01} {-0.02, -0.02, 0.01} } {20, 20, 20}, Format SimpleTable, File "b2.pos" ];
           Print[ phi, OnBox { {-0.02, -0.02, -0.01} {0.02, -0.02, -0.01} {-0.02, 0.02, -0.01} {-0.02, -0.02, 0.01} } {20, 20, 20}, File "phi2.pos" ];

		}
	}
}

