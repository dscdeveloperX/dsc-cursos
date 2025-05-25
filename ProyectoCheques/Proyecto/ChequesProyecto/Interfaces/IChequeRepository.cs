using ChequesProyecto.Data.Request;

namespace ChequesProyecto.Interfaces

{
    public interface IChequeRepository
    {
         public  Task<bool> ChequeCreate(ChequeCreateRequest request);

        


    }
}
