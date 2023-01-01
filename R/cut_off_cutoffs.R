"""function for executing cutoffs - removing oxbows from centerline and storing cutoff coordinates
    x,y - coordinates of centerline
    crdist - critical cutoff distance
    deltas - distance between neighboring points along the centerline
    outputs:
    x,y,z - updated coordinates of centerline
    xc, yc, zc - lists with coordinates of cutoff segments"""


cut_off_cutoffs <- function(x,y,z,s,crdist,deltas){
  xc = c()
  yc = c()
  zc = c()
}


ind1, ind2 = find_cutoffs(x,y,crdist,deltas) # initial check for cutoffs
while len(ind1)>0:
  xc.append(x[ind1[0]:ind2[0]+1]) # x coordinates of cutoff
  yc.append(y[ind1[0]:ind2[0]+1]) # y coordinates of cutoff
  zc.append(z[ind1[0]:ind2[0]+1]) # z coordinates of cutoff
  x = np.hstack((x[:ind1[0]+1],x[ind2[0]:])) # x coordinates after cutoff
  y = np.hstack((y[:ind1[0]+1],y[ind2[0]:])) # y coordinates after cutoff
  z = np.hstack((z[:ind1[0]+1],z[ind2[0]:])) # z coordinates after cutoff
  ind1, ind2 = find_cutoffs(x,y,crdist,deltas)
return x,y,z,xc,yc,zc
