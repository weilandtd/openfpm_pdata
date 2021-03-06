# Change Log
All notable changes to this project will be documented in this file.

## [development]

### Added
- Introduced getDomainIterator for Cell-list
- Example to show how to add sensors in SPH/particle based methods (see Vector/7_SPH_opt)
- Increased performance of 7_SPH_opt
- Vortex in Cell example Numerics/Vortex_in_cell
- Interpolation functions (see Numerics/vortex_in_cell example)
- Gray-scott 3d example with stencil iterator optimixation (see Grid/gray_scott_3d example)
- HDF5 Check point restart for vector_dist particles (see Vector/1_HDF5_save_and_load) 
- Raw reader for grid (see ...)
- A way to specify names for properties and select properties to write (in PROGRESS)
- Ghost put on grid (see Vortex in Cell example)
- getDomainIterator stencil for faster stencil codes iterators see (Grid/gray_scott_3d example)
- Algebraic multigrid solvers interface for linear systems (see Vortex in Cell example)
- Added setPropNames in vector_dist see Vector/0_simple
- Support for Windows with CYGWIN

### Fixed
- Installation of PETSC in case with MUMPS try without MUMPS
- In case of miss compilation ignore system wide installation
- 2 Bugs in 7_SPH_opt and 7_SPH_opt error in Kernel and update for boundary particles
- Bug in VTK writer binary in case of vectors
- Bug in VTK writer binary: long int are not supported removing output
- Bug in FDScheme in the constructor with stencil bigger than one
- Bug Fixed Memory leak in petsc solver
- Bug Performance bug in the grid iterator

### Changed
- CellList types has changed for example
	  CellList<3, double, FAST, shift<3,double>>
  become
          CellList<3, double, Mem_fast<3, double>, shift<3, double>>
- getIterator in CellList changed getCellIterator
- Grid iterator types has changes (one additional template parameter)
- FDScheme the constructor now has one parameter less (Parameter number 4 has been removed) (see Stokes_Flow examples in Numerics)

## [0.8.0] 28 February 2017

### Added
- Dynamic Load balancing
- Added SPH Dam break with Dynamic load balancing (7_sph_dlb)(7_sph_dlb_opt)
- Added automatic procedure for update ./install --update and --upgrade
  (From 0.8.0 version will have a long term support for bug fixing. End-of-life of 0.8.0 is not decided yet, it should be still supported for bug fixing after release 0.9.0)
- Added video lessons for Dynamic load balancing (openfpm.mpi-cbg.de)
  (website officially open)
- Added for debugging the options PRINT_STACKTRACE, CHECKFOR_POSNAN, CHECKFOR_POSINF, CHECKFOR_PROPINF, CHECKFOR_PROPNAN, SE_CLASS3.
- Added the possibility to write binary VTK files using VTK_WRITER and FORMAT_BINARY see 0_simple_vector for an example

### Fixed
- Installation of PETSC with MUMPS  

### Changed
- BOOST updated to 1.63
- Eigen updated to 3.3.7

## [0.7.1] 28 January 2017

### Fixed
- Multiphase verlet single to all case generate overflow

## [0.7.0] 15 December 2016

### Added
- Symmetric cell-list/verlet list Crossing scheme
- VCluster examples
- cell-list crossing scheme

### Fixed
- CRITICAL BUG: OpenFPM has a bug handling decomposition when a processor has a disconnected domains
                (By experience this case has been seen on big number of processors).
- Found and fixed a memory leak when using complex properties

-### Changed
- The file VCluster has been mooved #include "VCluster.hpp" must be changed to #include "VCluster/VCluster.hpp"
  BECAUSE OF THIS, PLEASE CLEAN THE OPENFPM FOLDER OTHERWISE YOU WILL END TO HAVE 2 VCLUSTER.HPP

## [0.6.0] - 5 November 2016

### Added
- Symmetric cell-list/verlet list
- Multi-phase cell-list and Multi-phase cell-list
- Added ghost_get that keep properties
- Examples: 1_ghost_get_put it show how to use ghost_get and put with the new options
            4_multiphase_celllist_verlet completely rewritten for new Cell-list and multiphase verlet
	    5_molecular_dynamic use case of symmetric cell-list and verlet list with ghost put
	    6_complex_usage It show how the flexibility of openfpm can be used to debug your program
- Plotting system can export graph in svg (to be included in the paper)

 
### Fixed
- Option NO_POSITION was untested
- Regression: Examples code compilation was broken on OSX (Affect only 0.5.1)
              (Internal: Added OSX examples compilarion/running test in the release pipeline)
- gray_scott example code (variable not initialized)


### Changes


## [0.5.1] - 27 September 2016

### Added
- ghost_put support for particles
- Full-Support for complex property on vector_dist (Serialization)
- Added examples for serialization of complex properties 4_Vector
- improved speed of the iterators

### Fixed
- Installation PETSC installation fail in case of preinstalled MPI
- Miss-compilation of SUITESPARSE on gcc-6.2
- vector_dist with negative domain (Now supported)
- Grid 1D has been fixed
- One constructor of Box had arguments inverted.
  PLEASE CAREFULL ON THIS BUG
     float xmin[] = {0.0,0.0};
     float xmax[] = {1.0,1.0};
     // Box<2,float> box(xmax,xmin)    BUG IT WAS xmax,xmin
	 Box<2,float> box(xmin,xmax)  <--- NOW IT IS xmin,xmax
	 Box<2,float> box({0.0,0.0},{1.0,1.0}) <---- This constructor is not affected by the BUG

### Changed
- On gcc the -fext-numeric-literals compilation flag is now mandatory

## [0.5.0] - 15 August 2016

### Added
- map communicate particles across processors mooving the information of all the particle map_list give the possibility to give a list of property to move from one to another processor
- Numeric: Finite Differences discretization with matrix contruction and parallel solvers (See example ... )
- vector_dist now support complex object like Point VectorS Box ... , with no limitation
   and more generic object like std::vector ... (WARNING TEMPORARY LIMITATION: Communication is not supported property must be excluded from communication using map_list and ghost_get)
- vector_dist support expressions (See example ...)
- No limit to ghost extension (they can be arbitrary extended)
- Multi-phase CellList
- Hilber curve data and computation reordering for cache firndliness

### Fixed
- Removed small crash for small grid and big number of processors

### Changed

### Known Bugs

- On gcc 6.1 the project does not compile
- Distributed grids on 1D do not work


## [0.4.0] - 26-05-2016

### Added
- Grid with periodic boundary conditions
- VTK Writer for distributed vector, now is the default writer
- Installation of linear algebra packages
- More user friendly installation (No environment variables to add in your bashrc, installation report less verbose)

### Fixed
- GPU compilation
- PARMetis automated installation
- Critical Bug in getCellList, it was producing Celllist with smaller spacing

### Changed


## [0.3.0] - 16-04-2016

### Added
- Molacular Dynamic example
- addUpdateCell list for more optimal update of the cell list instead of recreate the CellList

### Fixed
- Nothing to report

### Changed
- Eliminated global_v_cluster, init_global_v_cluster, delete_global_v_cluster, 
  substituted by 
  create_vcluster, openfpm_init, openfpm_finalize
- CartDecomposition parameter for the distributed structures is now optional
- template getPos<0>(), substituted by getPos()

## [0.2.1] - 01-04-2016

### Changed
- GoogleChart name function changed: AddPointGraph to AddLinesGraph and AddColumsGraph to AddHistGraph

## [0.2.0] - 2016-03-25
### Added
- Added Load Balancing and Dynamic Load Balancing on Beta
- PSE 1D example with multiple precision
- Plot example for GoogleChart plotting
- Distributed data structure now support 128bit floating point precision (on Beta)

### Fixed
- Detection 32 bit system and report as an error
- Bug in rounding off for periodic boundary condition

### Changed
- Nothing to report

## [0.1.0] - 2016-02-05
### Added
- PSE 1D example
- Cell list example
- Verlet list example
- Kickstart for OpenFPM_numeric
- Automated dependency installation for SUITESPRASE EIGEN OPENBLAS(LAPACK)


### Fixed
- CRITICAL BUG in periodic bondary condition
- BOOST auto updated to 1.60
- Compilation with multiple .cpp files

### Changed
- Nothing to report



# Planned in the next Releases

## [0.9.0] - Mid March

- Algebraic Multigrid solver
- Parallel VTK, improved visualization

## [0.10.0] -  July 2017

### Added
- Dynamic Load Balancies examples and interface fixation
- Check Point restart
- More example and documentations

## [0.9.0] - May 2017

### Added
- Asynchronous communication
- Support for Microsoft Windows with Cygwin
- Defining a domain an invalid domain like Box<2,float> box({0.0,1.0},{0.0,1.0}) (the correct is {0.0,0.0},{1.0,1.0}  )
           produce dead-lock or unclear error message in SE_CLASS1, not hint is given, added usefull error message



