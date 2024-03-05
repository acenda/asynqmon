FROM golang:1.22-alpine AS backend

# Go install the forked version of asynqmon.
RUN go install github.com/acenda/asynqmon/cmd/asynqmon@gomod_edit

FROM scratch

# Copy binary from the backend stage.
COPY --from=backend ["/go/bin/asynqmon", "/asynqmon"]

# Command to run when starting the container.
ENTRYPOINT ["/asynqmon"]
