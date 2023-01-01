# """function for finding diagonal indices with k offset
#     [from https://stackoverflow.com/questions/10925671/numpy-k-th-diagonal-indices]"""
#

kth_diag_indices <- function(a,k){

  row_n = nrow(a)
  col_n = ncol(a)

  if(k<0){
    rows = 1:(row_n + k)
    cols = ((-1 * k) + 1):col_n
  }

  if(k>0){
    rows = (k+1):row_n
    cols = 1:((-1 * k) + col_n)
  }

  return(list("rows" = rows, "cols" = cols))

}
