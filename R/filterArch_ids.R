#' Filter the protein architectures based on conserved domains
#'
#' Parse the architecture identifiers and extract those that contain, at
#' least, those selected in the filter.
#'
#' @usage
#' filterArch_ids(archs_ids, filter)
#'
#' @param archs_ids A string with the architecture identifiers that contain,
#' at least, one of the conserved domains defining the gene family.
#' @param filter A string with the domains (and order) that are required
#'   (at least) for the proteins to have.
#'
#' @importFrom curl has_internet
#'
#' @return
#' the architecture identifiers from all the potential protein architectures
#' defined by \code{getArch_ids} that contain, at least, the conserved
#' domains explicitily show by the filter.
#'
#' @seealso \code{\link{getArch_ids}}
#'
#' @examples \dontrun{
#' archs_ids <- getArch_ids("pfam02362")
#' my_filter <- c("B3_DNA", "Auxin_resp")
#' 
#' filterArch_ids(archs_ids, my_filter) 
#' }
#' \dontshow{
#' archs_ids <- c("12034166", "12034151", "11279088")
#' my_filter <- c("B3_DNA", "Auxin_resp")
#' filterArch_ids(archs_ids, my_filter) }
#'
#' @author Jose V. Die
#'
#' @export


filterArch_ids <-
function(archs_ids, filter) {

  if(!has_internet()) {
    message("This function requires Internet connection.")
    } else {
      tryCatch(
        expr    = {filterarchids_warning(archs_ids, filter)}, 
        error   = function(e) {message("NCBI servers are busy. Please try again a bit later.")},
        warning = function(w) {message("NCBI servers are busy. Please try again a bit later.")}
      )
      
      }
}
