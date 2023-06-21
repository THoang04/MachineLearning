### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ 7d3f3822-c22f-11ed-110a-a31276c7cb7e
using DelimitedFiles

# ╔═╡ 19dac696-3362-4771-93a3-d8335fa99518
A = readdlm("C:/Users/BMC/Documents/julia/fuel.txt", ',')

# ╔═╡ c18e8e4f-59da-4675-b8e1-a259820d3898
Drivers = A[2:end, 2]

# ╔═╡ db8c4dcc-1177-46ae-abda-9fe4c90d0395
FuelC = A[2:end, 3]

# ╔═╡ f5f3e036-43e0-48ec-9033-ab71f6a97bae
Income = A[2:end, 4]

# ╔═╡ e8009d41-7686-4ea2-a138-6b8542187a70
Pop = A[2:end, 7]

# ╔═╡ 826d9a34-634e-43b7-afe9-5599fb3d61a5
Tax = A[2:end, 8]

# ╔═╡ 3dd5fd94-666a-4aa8-8807-90c78d267155
logMiles = log2.(A[2:end,5])

# ╔═╡ 132826e7-f101-4517-bc0a-98ca55d375c8
Fuel = 1000 * FuelC ./ Pop

# ╔═╡ 9518fe08-b12b-4ade-9748-4589535124eb
Dlic = 1000 * Drivers ./ Pop

# ╔═╡ c7601f04-1d4d-4dcc-b877-29c83f74c1fd
x = [Tax Dlic Income logMiles]

# ╔═╡ 2b1d90fd-678c-4564-b0e4-689dd934891d
N = length(x[:,1])

# ╔═╡ cc25b3b8-8b71-45f0-ae49-48dd104826ea
X = float.([ones(N) x])

# ╔═╡ 29990e0d-c72d-495b-9352-d5e3afe74943
y = Fuel

# ╔═╡ fb4415cd-a460-441a-a30c-59b2dd8d4cde
# INPUT: X, y
# OUTPUT: θ
# y =  X*θ # y of shape/size: Nx1; X: shape Nx2, θ = 2x1 [θ_0, θ_1]

# ╔═╡ 0249a2cd-bd34-4bc1-a057-6adb245247f7
train(X, y) = inv(X'*X)*X'*y # inverse function, normal equation method

# ╔═╡ 8efffe8a-81be-4ca5-9a60-519e4cb2ab87
θ = train(X, y)

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
# ╠═7d3f3822-c22f-11ed-110a-a31276c7cb7e
# ╠═19dac696-3362-4771-93a3-d8335fa99518
# ╠═c18e8e4f-59da-4675-b8e1-a259820d3898
# ╠═db8c4dcc-1177-46ae-abda-9fe4c90d0395
# ╠═f5f3e036-43e0-48ec-9033-ab71f6a97bae
# ╠═e8009d41-7686-4ea2-a138-6b8542187a70
# ╠═826d9a34-634e-43b7-afe9-5599fb3d61a5
# ╠═3dd5fd94-666a-4aa8-8807-90c78d267155
# ╠═132826e7-f101-4517-bc0a-98ca55d375c8
# ╠═9518fe08-b12b-4ade-9748-4589535124eb
# ╠═c7601f04-1d4d-4dcc-b877-29c83f74c1fd
# ╠═2b1d90fd-678c-4564-b0e4-689dd934891d
# ╠═cc25b3b8-8b71-45f0-ae49-48dd104826ea
# ╠═29990e0d-c72d-495b-9352-d5e3afe74943
# ╠═fb4415cd-a460-441a-a30c-59b2dd8d4cde
# ╠═0249a2cd-bd34-4bc1-a057-6adb245247f7
# ╠═8efffe8a-81be-4ca5-9a60-519e4cb2ab87
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
