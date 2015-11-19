/* --------------------------------------------------------------------------
    GetDP Problem Definition file 
   -------------------------------------------------------------------------- */


/* Input

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

*/



Jacobian {
	{ Name JVol ;
		Case { 
			{ Region All; Jacobian Vol; }
		}
	}
}


Integration {
	{ Name I1 ;
		Case { 
			{ Type Gauss ;
				Case { 
					{ GeoElement Triangle    ; NumberOfPoints  4 ; }
					{ GeoElement Quadrangle  ; NumberOfPoints  4 ; }
					{ GeoElement Tetrahedron ; NumberOfPoints  4 ; }
				}                                                 
			}
		}
	}
}


/* --------------------------------------------------------------------------
   3D Magnetostatics formulation
   -------------------------------------------------------------------------- */
   
FunctionSpace {
	{ Name Hgrad_phi; Type Form0;				// scalar potential
		BasisFunction {
			{ Name sn; NameOfCoef phin; Function BF_Node; Support Omega;
			  Entity NodesOf[ All ]; }	// associated with the nodes of Omega
		}
		Constraint { 					// essential constraint   
			{ NameOfCoef phin; EntityType NodesOf; NameOfConstraint phi; }
		}
	}
	
}


Formulation {
	{ Name MagSta_phi; Type FemEquation;
		Quantity {
			{ Name phi; Type Local; NameOfSpace Hgrad_phi; }
		}
		Equation {
			Galerkin{ [ - mu[] * Dof{ d phi }, { d phi } ];In Omega; Jacobian JVol; Integration I1; }
			Galerkin{ [ - mu[] * hc[], { d phi } ];In Magnet1; Jacobian JVol; Integration I1; }
                        Galerkin{ [ - mu[] * hc[], { d phi } ];In Magnet2; Jacobian JVol; Integration I1; }		  
                        Galerkin{ [ - mu[] * hc[], { d phi } ];In Magnet3; Jacobian JVol; Integration I1; }              
                        Galerkin{ [ - mu[] * hc[], { d phi } ];In Magnet4; Jacobian JVol; Integration I1; }
                        Galerkin{ [ - mu[] * hc[], { d phi } ];In Magnet5; Jacobian JVol; Integration I1; }
			Galerkin{ [ - mu[] * hc[], { d phi } ];In Magnet6; Jacobian JVol; Integration I1; }
			Galerkin{ [ - mu[] * hc[], { d phi } ];In Magnet7; Jacobian JVol; Integration I1; }
			Galerkin{ [ - mu[] * hc[], { d phi } ];In Magnet8; Jacobian JVol; Integration I1; }
		}
	}
}


Resolution {
	{ Name MagSta_phi;
		System {
			{ Name A; NameOfFormulation MagSta_phi; }
		}
		Operation { 
              Generate[ A ]; Solve[ A ]; SaveSolution[ A ]; 
            }
	}
}


PostProcessing {
	{ Name MagSta_phi; NameOfFormulation MagSta_phi;
		Quantity {
	      { Name b; Value{ Local { [ - mu[] * { d phi } ]; In Omega; Jacobian JVol; }
                               Local { [ - mu[] * hc[] ]     ; In Magnet1; Jacobian JVol; }
                               Local { [ - mu[] * hc[] ]     ; In Magnet2; Jacobian JVol; }
                               Local { [ - mu[] * hc[] ]     ; In Magnet3; Jacobian JVol; }
                               Local { [ - mu[] * hc[] ]     ; In Magnet4; Jacobian JVol; }
                               Local { [ - mu[] * hc[] ]     ; In Magnet5; Jacobian JVol; }
                               Local { [ - mu[] * hc[] ]     ; In Magnet6; Jacobian JVol; }
                               Local { [ - mu[] * hc[] ]     ; In Magnet7; Jacobian JVol; }
                               Local { [ - mu[] * hc[] ]     ; In Magnet8; Jacobian JVol; } } }

// }}
    		{ Name phi; Value{ Local{ [ { phi } ]; In Omega; Jacobian JVol; } } }
    		{ Name h; Value { Local { [ { d phi} ]; In Omega; Jacobian JVol; } } }
		}
	}
}


