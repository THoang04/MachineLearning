### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ 7aed10e0-ddb1-11ed-2987-738d1b892402
using DelimitedFiles

# ╔═╡ 0f7db8b0-5892-4fdd-8cf7-4756b2fc849a
X = readdlm("C:/Users/BMC/Documents/julia/X_wine_data.txt")

# ╔═╡ 5f1e448a-81d4-4bee-8e3d-997c34d2b8d2
y = readdlm("C:/Users/BMC/Documents/julia/y_wine_data.txt")

# ╔═╡ aff3b8ec-3d35-4987-b6ed-79652918e93f
length(y[y .== 0])

# ╔═╡ d3078dba-fd04-4a6c-9347-46eda40cd818
X0 = X[1:59, :]

# ╔═╡ 4e838c62-997a-4b3a-80bd-e9a67561a549
length(y[y .== 1])

# ╔═╡ fe9993d8-64f9-40e8-8f7e-874490fa179f
X1 = X[60:131, :]

# ╔═╡ 4582e6b2-0fa8-4a14-91aa-670b60107fe2
X2 = X[131:178, :]

# ╔═╡ e8ec4cbe-d8dc-49d3-bffe-f238665214c4
train(X, y) = inv(X'*X)*X'*y

# ╔═╡ d6dc4e5d-795c-4254-8889-1005e761e210
θ = train(X, y)

# ╔═╡ ed367790-534b-474c-942f-cd969e27b44f
function predict(x, θ)
	P = x * θ
	if P >= 0.5
		1.0
	else
		0.0
	end
end

# ╔═╡ 63748a96-b983-497e-b7e1-5c1c643722fd
predict(X, θ)

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
# ╠═7aed10e0-ddb1-11ed-2987-738d1b892402
# ╠═0f7db8b0-5892-4fdd-8cf7-4756b2fc849a
# ╠═5f1e448a-81d4-4bee-8e3d-997c34d2b8d2
# ╠═aff3b8ec-3d35-4987-b6ed-79652918e93f
# ╠═d3078dba-fd04-4a6c-9347-46eda40cd818
# ╠═4e838c62-997a-4b3a-80bd-e9a67561a549
# ╠═fe9993d8-64f9-40e8-8f7e-874490fa179f
# ╠═4582e6b2-0fa8-4a14-91aa-670b60107fe2
# ╠═e8ec4cbe-d8dc-49d3-bffe-f238665214c4
# ╠═d6dc4e5d-795c-4254-8889-1005e761e210
# ╠═ed367790-534b-474c-942f-cd969e27b44f
# ╠═63748a96-b983-497e-b7e1-5c1c643722fd
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
