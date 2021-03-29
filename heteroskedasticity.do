* dependencies: set scheme, plottig, whitetst, estat

clear
set obs 1000
set seed 12345
* optional plot scheme setting 
set scheme plottig

* creating an x-variable 
gen x = rnormal(50, 20)
replace x=0 if x<0
drop if x>100
hist x, normal

* now to generate the heteroskedasticity
gen f = 14*runiform()
sort x
gen u = f+.2*x*rnormal()

* generating a dependent variable
gen y = 2*x + u 

* let's take a looksee
twoway (scatter y x)(lfit y x)

reg y x 
predict u_hat, resid
twoway (scatter u_hat x)
* or alternatively use a package
rvfplot

gen u_hat2 = u_hat^2
gen x2 = x^2
predict y_hat
gen y_hat2 = y_hat^2
gen y_hat3 = y_hat^3

* Ramsey RESET
reg u_hat y_hat2 y_hat3

* Breusch-Pagan test (low p-value: reject null -> evidence for heteroskedasticity)
reg u_hat2 x
test x=0
* or using a package
quietly reg y x
hettest 

* "special" White test (Wooldridge)
reg u_hat2 y_hat y_hat2
test y_hat=y_hat2=0

* or use a package
quietly reg y x
estat imtest, white
* alternative whitetst package
whitetst

* Szroeter test 
szroeter x

* comparing solutions
reg y x
reg y x, robust
reg y x [aweight=x]
wls0 y x, wvars(x) type(abse) robust graph







