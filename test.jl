### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ 4b91fec0-c3a6-11ed-18c7-21c5cb41034b
B = [0 1 3 4 5; 1 1 6 8 9; 2 0 3 4 7; 3 1 3 7 9; 4 5 1 2 5]

# ╔═╡ 87050ba5-8da1-47a9-9066-0af73babd6ad
C = rand(4,4)

# ╔═╡ 40d60b12-dea0-4504-b585-588daf06f090
B[2:end,1]

# ╔═╡ d44dfaaa-44d8-4432-b283-2892a93305c3
A = [4 4 4 4 4]

# ╔═╡ 7faeba13-884d-453a-a2a6-391040bff5bb
D = [1 1 1 1 2]

# ╔═╡ 4629d1bc-bbc6-414a-8782-8027705a2e10
E = [true true false]

# ╔═╡ a92b6920-2dbb-46c6-9ad0-52dc329cd264
sum(E)

# ╔═╡ 3b96a663-20fb-4857-b58d-fdf2a2baa445
A ./ D

# ╔═╡ f381b9e4-b1b9-4e8e-aefc-3c253915c766
3 .* A'

# ╔═╡ 9054ca5e-0f44-46fb-8650-2d6c3bd85b7c
log2.(A)

# ╔═╡ 9c6bd5ca-fae7-4b8f-a18e-ae1b87a5d3cf
Int64(1.2)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.5"
manifest_format = "2.0"
project_hash = "da39a3ee5e6b4b0d3255bfef95601890afd80709"

[deps]
"""

# ╔═╡ Cell order:
# ╠═4b91fec0-c3a6-11ed-18c7-21c5cb41034b
# ╠═87050ba5-8da1-47a9-9066-0af73babd6ad
# ╠═40d60b12-dea0-4504-b585-588daf06f090
# ╠═d44dfaaa-44d8-4432-b283-2892a93305c3
# ╠═7faeba13-884d-453a-a2a6-391040bff5bb
# ╠═4629d1bc-bbc6-414a-8782-8027705a2e10
# ╠═a92b6920-2dbb-46c6-9ad0-52dc329cd264
# ╠═3b96a663-20fb-4857-b58d-fdf2a2baa445
# ╠═f381b9e4-b1b9-4e8e-aefc-3c253915c766
# ╠═9054ca5e-0f44-46fb-8650-2d6c3bd85b7c
# ╠═9c6bd5ca-fae7-4b8f-a18e-ae1b87a5d3cf
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
