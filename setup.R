library(cli)
library(pracma)


W = 200.0                    # channel width (m)
D = 16.0                     # channel depth (m)
pad = 100                    # padding (number of nodepoints along centerline)
deltas = 50.0                # sampling distance along centerline
nit = 1500                   # number of iterations
Cf = 0.03                    # dimensionless Chezy friction factor
crdist = W                   # threshold distance at which cutoffs occur
kl = 60.0/(365*24*60*60.0)   # migration rate constant (m/s)
kv =  3*10*5.0E-13           # vertical slope-dependent erosion rate constant (m/s)
dt = 0.1*(365*24*60*60.0)    # time step (s)
dens = 1000                  # density of water (kg/m3)
saved_ts = 20                # which time steps will be saved
n_bends = 30                 # approximate number of bends you want to model
Sl = 0.0                     # initial slope (setting this to non-zero results in instabilities in long runs)
