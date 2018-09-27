#' Plot Candy Popularity
#'
#' @description This function produces a bar plot of the most popular Halloween candies
#'
#' @param df a dataframe containing information on the candies
#' @param n the number of top candies to plot.  Default is set at 10
#' @param candy_name_col the name of the column in \code{df} that specifies the names of the candies
#' @param rank_col the name of the column in \code{df} that specifies how to rank the candies
#'
#' @return a ggplot object
#'
#' @examples
#' plot_candy(candy_data, candy_name_col = "competitorname", rank_col = "winpercent")
#' @import dplyr
#' @import ggplot2
#' @export

plot_candy = function(df, n = 10, candy_name_col, rank_col){
  p = ggplot(df %>% top_n(n, wt=get(rank_col))) +
    geom_bar(aes(x = stats::reorder(get(candy_name_col),get(rank_col)), y = get(rank_col)), stat="identity") +
    coord_flip() +
    labs(x = candy_name_col, y = rank_col)

  return(p)
}
