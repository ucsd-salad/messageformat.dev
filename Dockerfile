FROM denoland/deno:2.0.6 AS build

WORKDIR /app
COPY . .
RUN deno run build

FROM nginx:alpine AS runtime

# Copy the built site from the build stage
COPY --from=build /app/_site /usr/share/nginx/html

# Expose port 
EXPOSE 80
