"""function for identifying locations of cutoffs along a centerline
    and the indices of the segments that will become part of the oxbows
    x,y - coordinates of centerline
    crdist - critical cutoff distance
    deltas - distance between neighboring points along the centerline"""
crdist = W
find_cutoffs <- function(x,y,crdist,deltas){
  diag_blank_width = as.integer((crdist+20*deltas)/deltas)
  # distance matrix for centerline points:
  dist = (cbind(x,y))
  dist = rdist::cdist(dist, dist)
  dist[dist>crdist] = NA # set all values that are larger than the cutoff threshold to Na

  for (k in seq(-diag_blank_width,diag_blank_width+1)){
    rows_cols = kth_diag_indices(dist,k)
    dist[rows_cols$rows, rows_cols$rows] = NA
  }

  ind = which(is.na(dist), arr.ind = TRUE)

}

# distance matrix for centerline points:
dist = distance.cdist(np.array([x,y]).T,np.array([x,y]).T)
dist[dist>crdist] = np.NaN # set all values that are larger than the cutoff threshold to NaN
# set matrix to NaN along the diagonal zone:
for k in range(-diag_blank_width,diag_blank_width+1):
  rows, cols = kth_diag_indices(dist,k)
dist[rows,cols] = np.NaN
i1, i2 = np.where(~np.isnan(dist))
ind1 = i1[np.where(i1<i2)[0]] # get rid of unnecessary indices
ind2 = i2[np.where(i1<i2)[0]] # get rid of unnecessary indices
return ind1, ind2 # return indices of cutoff points and cutoff coordinates
