#!/usr/bin/env julia

import Base.readdir

# function show_files(directory::AbstractString)
# 	files = readdir(directory)
# 	for file in files
# 		println(file)
# 	end
# end
# 
# show_files(".")

println("Hola mundo, usando Julia\n")
using DataFrames, CSV, Statistics, PlotlyJS

df = CSV.read("APC.tsv", delim='\t', DataFrame)

head = first(df, 5)

col_names = names(df)

print(col_names)
print("\n")
variants = select!(df, [:variant_class, :sample])


df_combined = combine(groupby(variants, [:variant_class, :sample]), nrow => :n)

println("=================\n")
#println(first(df_combined,5))
println(df_combined)
println("=================\n")

## Ploting in Julia
p = plot(
	df_combined,
	x=:sample, y=:n, color=:variant_class,
	kind="bar", barmode="dodge",
	labels=Dict(
		:sample => "Sample",
		:n => "Number of variants",
		:variant_class => "Class" 
	),
	Layout(title="Number of variants per samples"),
		)

savefig(p, "julia.png")