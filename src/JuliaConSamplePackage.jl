module JuliaConSamplePackage
using ForwardDiff

export newton

"""
    newton(f, f′, x₀; maxiter = 100, tol = 1e-8)

Find `f`s root via Newton's method.
"""
function newton(f, f′, x₀; maxiter = 100, tol = 1e-8)
    xₙ₊₁ = x₀
    xₙ = NaN
    iter = 0
    while true
        fₓ₊₁ = f(xₙ₊₁)
        fₓ = f(xₙ)
        if abs(fₓ₊₁ - fₓ) < tol
            return xₙ₊₁
        end
        if iter > maxiter
            error("Did not converge!")
        end

        f′ₙ₊₁ = f′(xₙ₊₁)
        if f′ₙ₊₁ == 0.0
            error("Derivative is zero!")
        end
        xₙ₊₁, xₙ = xₙ₊₁ - fₓ₊₁/f′ₙ₊₁, xₙ₊₁
        iter += 1
    end
end

newton(f, x₀; maxiter = 100, tol = 1e-8) =
    newton(f, x -> ForwardDiff.derivative(f, x), x₀; maxiter = maxiter, tol = tol)

end
