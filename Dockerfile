FROM golang:1.22-alpine AS backend

# Copy and download dependencies.
RUN go install github.com/acenda/asynqmon/cmd/asynqmon@gomod_edit

FROM scratch

# Copy binary from /build to the root folder of the scratch container.
COPY --from=backend ["/go/bin/asynqmon", "/asynqmon"]

# Command to run when starting the container.
ENTRYPOINT ["/asynqmon"]
