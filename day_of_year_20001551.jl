### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ f9b46d80-b1bd-11ed-0324-1991bf516388
using DelimitedFiles

# ╔═╡ 29d749d2-9b31-436a-9b69-f40b4dc0d3ed
A = readdlm("C:/Users/BMC/Documents/julia/input.txt")

# ╔═╡ befb4853-f603-45dc-9156-fdda07e387e3
day = Int.(A[:,1])

# ╔═╡ 83aecd09-e6d2-4b09-95b0-5c8390d2d2ee
month = Int.(A[:,2])

# ╔═╡ 37fc7b6e-dddd-45c7-8451-2c557c78ec5f
year = Int.(A[:,3])

# ╔═╡ 3d806080-ea49-4d03-811a-95fccf1eb483
function get_yesterday(d, m, y)
	if y % 100 == 0 && y % 4 == 0 && m == 3 && d == 1
		print("29/2/",y)
	elseif d == 1 && m == 1
		print("31/12/",y-1)
	elseif d == 1
		if m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10 || m == 12
			print("30/",m-1,"/",y)
		else
			print("31/",m-1,"/",y)
		end
	else
		print(d-1,"/",m,"/",y)
	end
end

# ╔═╡ f69d6cda-3218-4132-8300-27bd2b5f51d2
function get_tomorrow(d, m, y)
	if y % 100 == 0 && y % 4 == 0 && m == 2 && d == 28
		print("29/2/",y)
	elseif d == 31 && m == 12
		print("1/1/",y+1)
	elseif d == 31
		if m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10 || m == 12
			print("1/",m+1,"/",y)
		else
			print("1/",m+1,"/",y)
		end
	else
		print(d+1,"/",m,"/",y)
	end
end

# ╔═╡ 31de5e8c-eefc-40e8-bb7e-a3663d8b3612
get_yesterday(1,1,1600)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
DelimitedFiles = "8bb1440f-4735-579b-a4ab-409b98df4dab"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.5"
manifest_format = "2.0"
project_hash = "739f2f3af706c750957bd6ec39e0874ba8eb265d"

[[deps.DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"
"""

# ╔═╡ Cell order:
# ╠═f9b46d80-b1bd-11ed-0324-1991bf516388
# ╠═29d749d2-9b31-436a-9b69-f40b4dc0d3ed
# ╠═befb4853-f603-45dc-9156-fdda07e387e3
# ╠═83aecd09-e6d2-4b09-95b0-5c8390d2d2ee
# ╠═37fc7b6e-dddd-45c7-8451-2c557c78ec5f
# ╠═3d806080-ea49-4d03-811a-95fccf1eb483
# ╠═f69d6cda-3218-4132-8300-27bd2b5f51d2
# ╠═31de5e8c-eefc-40e8-bb7e-a3663d8b3612
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
