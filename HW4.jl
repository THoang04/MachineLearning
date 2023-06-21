### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ 1b4ba460-c7ba-11ed-0a71-651dcd0f4fef
using DelimitedFiles

# ╔═╡ 33813cb0-9949-4809-aa17-65f0866f216f
A1 = readdlm("C:/Users/BMC/Documents/julia/winequality-red.csv", ';')

# ╔═╡ 5cff35ba-0fee-4b7c-a6d7-6f222b88728a
y1 = A1[2:end, end]

# ╔═╡ 4f40e2e6-451b-4ada-8241-c440b5e5fe6a
X1 = float.([ones(length(y1)) A1[2:end, 1:end-1]])

# ╔═╡ 6c6b75e9-f107-49b1-9c2b-93771379ab8c
train(X, y) = inv(X'*X)*X'*y

# ╔═╡ 40d683f3-0881-4c8b-9c50-fbd0a578c771
θ1 = train(X1, y1)

# ╔═╡ 2cbcb854-cbc7-4c49-a3fc-bb5422497895
predict(θ, xNew) = xNew * θ

# ╔═╡ 4962f4d5-4b99-4cee-bf3a-b961a456bc0e
ŷ1 = predict(θ1, X1)

# ╔═╡ 0cea97b4-4d68-4963-87af-cd05feed9982
ϵ = 0.5

# ╔═╡ a622b1d8-a79c-4326-93a1-d0f1aef58139
accuracy1 = sum(abs.(y1 - ŷ1) .<= ϵ) / length(y1)

# ╔═╡ a9631c03-5b05-4707-9be8-e9e7b20fe02a
A2 = readdlm("C:/Users/BMC/Documents/julia/winequality-white.csv", ';')

# ╔═╡ 1be4f0fd-3586-4d45-b9a4-4e984f26ff8d
y2 = A2[2:end, end]

# ╔═╡ 04ee85eb-4bff-4571-ace2-cc5a46354059
X2 = float.([ones(length(y2)) A2[2:end, 1:end-1]])

# ╔═╡ 1c9a5b49-477b-420b-bf5d-dd04c44a7f75
θ2 = train(X2, y2)

# ╔═╡ 12b5a0ff-88eb-4eb8-a21f-54a9294b1410
ŷ2 = predict(θ2, X2)

# ╔═╡ fbdec8b4-1301-466a-b11b-16b8d08f2335
accuracy2 = sum(abs.(y2 - ŷ2) .<= ϵ) / length(y2)

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
# ╠═1b4ba460-c7ba-11ed-0a71-651dcd0f4fef
# ╠═33813cb0-9949-4809-aa17-65f0866f216f
# ╠═5cff35ba-0fee-4b7c-a6d7-6f222b88728a
# ╠═4f40e2e6-451b-4ada-8241-c440b5e5fe6a
# ╠═6c6b75e9-f107-49b1-9c2b-93771379ab8c
# ╠═40d683f3-0881-4c8b-9c50-fbd0a578c771
# ╠═2cbcb854-cbc7-4c49-a3fc-bb5422497895
# ╠═4962f4d5-4b99-4cee-bf3a-b961a456bc0e
# ╠═0cea97b4-4d68-4963-87af-cd05feed9982
# ╠═a622b1d8-a79c-4326-93a1-d0f1aef58139
# ╠═a9631c03-5b05-4707-9be8-e9e7b20fe02a
# ╠═1be4f0fd-3586-4d45-b9a4-4e984f26ff8d
# ╠═04ee85eb-4bff-4571-ace2-cc5a46354059
# ╠═1c9a5b49-477b-420b-bf5d-dd04c44a7f75
# ╠═12b5a0ff-88eb-4eb8-a21f-54a9294b1410
# ╠═fbdec8b4-1301-466a-b11b-16b8d08f2335
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
