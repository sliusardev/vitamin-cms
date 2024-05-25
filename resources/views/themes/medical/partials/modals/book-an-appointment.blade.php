<div class="modal fade" id="bookAnAppointment" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="bookAnAppointmentLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="bookAnAppointmentLabel">
                    Book An Appointment
                </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="{{formActionSlug('book-an-appointment')}}" method="post">
                    @csrf
                    <div class="mb-3">
                        <label for="appointment-form--name" class="form-label">Name</label>
                        <input type="text" name="name" class="form-control" id="appointment-form-name" placeholder="Name">
                    </div>
                    <div class="mb-3">
                        <label for="appointment-form-email" class="form-label">Email address</label>
                        <input type="email" name="email" class="form-control" id="appointment-form-email" placeholder="name@example.com">
                    </div>
                    <div class="mb-3">
                        <label for="appointment-form-phone" class="form-label">Phone</label>
                        <input type="text" name="phone" class="form-control" id="appointment-form-phone" placeholder="+13245345">
                    </div>
                    <div class="mb-3">
                        <label for="appointment-form-datetime" class="form-label">Date and Time</label>
                        <input type="datetime-local" name="datetime" class="form-control" id="appointment-form-datetime">
                    </div>
                    <div class="mb-3">
                        <label for="appointment-form-message" class="form-label">Additional message</label>
                        <textarea class="form-control" name="message" id="appointment-form-message" rows="3"></textarea>
                    </div>
                    <button type="submit" class="btn btn-secondary w-100 medical-bg">Send</button>
                </form>
            </div>
        </div>
    </div>
</div>
