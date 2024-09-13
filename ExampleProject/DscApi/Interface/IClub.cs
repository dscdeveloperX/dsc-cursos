using DscApi.Models.Entity;
using DscApi.Models.Request;
using DscApi.Models.Response;

namespace DscApi.Interface
{
    public interface IClub
    {
        public Task<List<Club>> SelectAllClub();
        public Task<List<Club>> SelectByIdClub(int id);
        public Task<bool> InsertClub(ClubInsertRequest request);
        public Task<bool> UpdateClub(ClubUpdateRequest request);
        public Task<bool> DeleteClub(int id);

    }
}
