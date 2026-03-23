---
date: 23/03/2026
title: Pure OOP
---

## Pure OOP

While my mentor was reviewing my code, he mentioned that I was not following the OOP paradigm using the `when` clause in kotlin, which is a way of doing procedural programming. This shocked me, since I thought OOP was just about using classes and objects, but it seems that there is more to it than that.

In order to replicate a simple structure such as

```kotlin
sealed interface HttpResponseHandler {
    fun process(response: HttpApiResponse): HttpHandlerResponse

    data object Success : HttpResponseHandler {
        const val RESOURCE_CREATION = 201
        const val NO_BODY_SUCCESS = 204
        override fun process(response: HttpApiResponse): HttpHandlerResponse {
            val body = when (response.responseCode) {
                RESOURCE_CREATION -> "Resource created successfully"
                NO_BODY_SUCCESS -> "No content"
                else -> "Request successful"
            }
            return HttpHandlerResponse(isSuccessful = true, body)
        }
    }
}
```

A class for each when clause would be needed, for example:

```kotlin
data object Success : HttpResponseHandler {
    private val statusRegistry = mapOf(
        201 to Created,
        204 to NoContent
    )

    override fun process(response: HttpApiResponse): HttpHandlerResponse {
        val status = statusRegistry[response.responseCode] ?: DefaultSuccess
        
        return HttpHandlerResponse(
            isSuccessful = true,
            body = status.message() 
        )
    }
}

private interface SuccessType { fun message(): String }
private data object Created : SuccessType { override fun message() = "Resource created successfully" }
private data object NoContent : SuccessType { override fun message() = "No content" }
private data object DefaultSuccess : SuccessType { override fun message() = "Request successful" }
```

This doesn't seem to be needed in this case, since the `when` clause is not doing any complex logic, but if at some point a new code arises that needs to execute more complex logic, then it would be better to follow this approach and create a new class for it, instead of adding more cases to the `when` clause.
