# numerical-methods-matlab

Coursework showing MATLAB numerical methods from MAE 384 (Numerical Methods for Engineers) at Arizona State University.

---

## Files

### `HW1.m` — Error Analysis & Floating Point Arithmetic
- Relative error analysis of algebraic expressions
- Forward vs. backward summation accuracy comparison
- Single vs. double precision floating point behavior

### `HW2.m` — Root Finding & Linear Systems
- Ill-conditioned Hilbert matrix analysis using single precision
- Bisection method applied to a rocket velocity equation
- `fsolve` applied to a Mach number expansion problem

### `HW3.m` — Curve Fitting, Fourier Series & Numerical Integration
- Polynomial, Vandermonde matrix, spline, and `csape` curve fitting on drag vs. Reynolds number data
- Fourier series approximation of a triangle wave (kmax = 1, 3, 21)
- Trapezoidal rule and Simpson's rule to estimate the mass of the Earth from density data

### `HW4Q1.m` — Discrete Fourier Transform
- DFT coefficient extraction from vibration data

### `eulerexpHW4.m` — Euler Explicit Solver (reusable function)
- General-purpose explicit Euler ODE solver; called by HW4 scripts

### `rungekatta4HW4.m` — 4th-Order Runge-Kutta Solver (reusable function)
- General-purpose RK4 ODE solver; called by HW4 scripts

### `HW4Q4.m` — ODE Solver Comparison
- Hand solution via separation of variables compared against Euler explicit, RK4, and `ode45`
- All four methods plotted on a single graph; Euler explicit shown to be least accurate

### `HW5Q1.m`, `HW5Q1PartB.m`, `HW5Q1PartC.m`, `HW5Q19000.m`, `spacecraftODE.m` — Orbital Mechanics
- Two coupled 2nd-order equations of motion reduced to a 4-equation 1st-order system
- Spacecraft trajectory simulated in polar coordinates using `ode45`
- Three cases: decay orbit (impacts Earth), circular orbit, 9,000 m/s initial radial velocity
- Impact angle and velocity components computed at Earth's surface

### `HW5Q2PartC.m` — Beam Vibration Eigenvalues
- 4th-order PDE for a cantilever beam solved via separation of variables
- Bisection method used to find eigenvalues; first two vibration mode shapes plotted

### `HW5Q3PartA.m`, `HW5Q3PartB.m` — 1D Heat Equation
- Heat distribution along a rod solved analytically for homogeneous and non-homogeneous boundary conditions
- Fourier series solution plotted over beam length

### `HW6Q2.m` — Diffusion Equation: Explicit Finite Difference Method
- 1D pollutant diffusion in a pipe solved analytically via separation of variables
- Explicit (forward Euler) finite difference method implemented in a nested for loop
- Courant number selected for stability; numerical vs. analytical solution compared

### `HW6Q2B.m` — Diffusion Equation: Implicit Finite Difference Method
- Same problem solved using Euler's implicit method (backward Euler)
- Tridiagonal coefficient matrix assembled and solved each time step via backslash operator
- Implicit method shown to be more accurate than explicit at equivalent grid resolution

### `HWQ3.m`, `HWQ3A.m` — Nonlinear System: Helicopter Hover
- System of 3 nonlinear equations for helicopter hover solved with `fsolve`

---

## Rendered Output (PDFs)

PDFs are included for viewing without a MATLAB license:

| File | Contents |
|---|---|
| `HW3Live.pdf` | Curve fitting, Fourier series, numerical integration |
| `HW4Live.pdf` | DFT, RK4 stability analysis, ODE solver comparison |
| `HW5Final.pdf` | Orbital mechanics, beam vibration eigenvalues, heat equation |
| `HW6Live.pdf` | Diffusion equation — explicit and implicit finite difference methods |

---

## Tools & Languages
- MATLAB
- Numerical solvers: `ode45`, `fsolve`, `polyfit`, `csape`

---

## Author
Zachary Van Horn — Mechanical Engineering, Arizona State University
